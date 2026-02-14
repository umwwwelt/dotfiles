local curl = require("plenary.curl")

local function get_openai_budget()
	local openai_admin_key = os.getenv("OPENAI_ADMIN_KEY")

	if not openai_admin_key then
		return "🔒 OPENAI_ADMIN_KEY non défini"
	end

	local today = os.time()
	local first_day = os.time({ year = os.date("%Y"), month = os.date("%m"), day = 1 })

	local total_cost = 0
	local has_more = true
	local last_id = nil

	while has_more do
		-- Construire l'URL avec le paramètre after si nécessaire
		local usage_url = "https://api.openai.com/v1/organization/costs?start_time=" .. first_day .. "&end_time=" .. today
		if last_id then
			usage_url = usage_url .. "&after=" .. last_id
		end

		local usage_resp = curl.get(usage_url, {
			headers = {
				["Authorization"] = "Bearer " .. openai_admin_key,
			},
		})

		local ok1, usage_json = pcall(vim.fn.json_decode, usage_resp.body or "")

		print(vim.inspect(usage_json))
		if not ok1 then
			return "⚠️ Erreur décodage JSON OpenAI"
		end

		-- Itérer sur tous les éléments du tableau data
		for _, item in ipairs(usage_json.data) do
			if item and item.amount and item.amount.value then
				total_cost = total_cost + item.amount.value
			end
		end

		-- Vérifier s'il y a une page suivante
		has_more = usage_json.has_more or false
		if has_more and usage_json.data[#usage_json.data] then
			last_id = usage_json.data[#usage_json.data].id
		end
	end

	return string.format("💰 OpenAI : %.2f $", total_cost)
end

local function get_anthropic_budget()
	local anthropic_admin_key = os.getenv("ANTHROPIC_ADMIN_KEY")

	if not anthropic_admin_key then
		return "🔒 ANTHROPIC_ADMIN_KEY non défini"
	end

	-- Obtenir le premier jour du mois courant
	local today = os.date("*t")
	local first_day = os.date("%Y-%m-01")
	local last_day = os.date("%Y-%m-%d")

	-- L'endpoint correct de l'API Anthropic pour les coûts
	local usage_url = "https://api.anthropic.com/v1/usage_summary"
		.. "?start_date="
		.. first_day
		.. "&end_date="
		.. last_day

	local usage_resp = curl.get(usage_url, {
		headers = {
			["x-api-key"] = anthropic_admin_key,
			["anthropic-version"] = "2024-01-01", -- Mise à jour de la version de l'API
		},
	})

	local ok, usage_json = pcall(vim.fn.json_decode, usage_resp.body or "")

	print(vim.inspect(usage_json))
	if not ok then
		return "⚠️ Erreur décodage JSON Anthropic"
	end

	local total_cost = 0
	if usage_json.total_usage then -- Changement de la structure JSON
		total_cost = usage_json.total_usage.amount_usd or 0
	end

	if total_cost == 0 then
		return "⚠️ Données de facturation Anthropic indisponibles"
	end

	-- Modifier le retour pour afficher le coût en dollars
	return string.format("🤖 Anthropic : %.2f $", total_cost)
end

-- Fonction qui combine les deux budgets
local function get_total_budget()
	local openai_result = get_openai_budget()
	local anthropic_result = get_anthropic_budget()

	return openai_result .. "\n" .. anthropic_result
end

return {
	get_openai_budget = get_openai_budget,
	get_anthropic_budget = get_anthropic_budget,
	get_total_budget = get_total_budget,
}
