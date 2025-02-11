local M = {}

---@class DiathekeVerse
---@field book string
---@field chapter string
---@field verse_number string
---@field verse_prefix_newline boolean
---@field verse string
---@field verse_suffix_newline boolean

--- Parse raw diatheke output to the expected format.
---@param output string raw diatheke output
---@return DiathekeVerse[] verses
local function parse_raw_output(output)
	local verses = {}

	_ = output:gsub("([%w ]+) ([%d]+):([%d]+):([%s]+)([^\r\n]+)[\r\n]", function(book, chap, vnum, prefix, v)
		if book and chap and vnum and v then
			table.insert(verses, {
				book = book,
				chapter = chap,
				verse_number = vnum,
				verse_prefix_newline = prefix and prefix:find("[\r\n]") ~= nil,
				verse = v,
				verse_suffix_newline = false,
			})
		end
	end)

	return verses
end

--- Call diatheke CLI and return the parsed output.
---@param translation string translation type of bible; corresponds to -b flag of diatheke. e.g. KJV, ISV
---@param format string output_format of diatheke; corresponds to -f flag of diatheke. e.g. plain, HTML
---@param locale string locale on the local machine. e.g. en
---@param query string query to diatheke.
---@return DiathekeVerse[] verses
function M.call(translation, format, locale, query)
	local command = string.format("diatheke -b %s -f %s -l %s -k %s", translation, format, locale, query)
	local command_output = vim.fn.system(command)
	if vim.v.shell_error ~= 0 then
		error("diatheke command return error|command=" .. command)
	end
	return parse_raw_output(command_output)
end

return M
