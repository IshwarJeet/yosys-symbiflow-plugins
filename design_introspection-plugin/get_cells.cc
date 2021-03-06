/*
 *  yosys -- Yosys Open SYnthesis Suite
 *
 *  Copyright (C) 2012  Clifford Wolf <clifford@clifford.at>
 *  Copyright (C) 2020  The Symbiflow Authors
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */
#include "get_cells.h"

USING_YOSYS_NAMESPACE

std::string GetCells::TypeName() { return "cell"; }

std::string GetCells::SelectionType() { return "c"; }

GetCells::SelectionObjects GetCells::ExtractSelection(RTLIL::Design* design, const CommandArgs& args) {
    SelectionObjects selected_objects;
    for (auto module : design->selected_modules()) {
	for (auto cell : module->selected_cells()) {
	    if (args.filters.size() > 0) {
		Filter filter = args.filters.at(0);
		std::string attr_value = cell->get_string_attribute(
		    RTLIL::IdString(RTLIL::escape_id(filter.first)));
		if (attr_value.compare(filter.second)) {
		    continue;
		}
	    }
	    std::string object_name(RTLIL::unescape_id(cell->name));
	    selected_objects.push_back(object_name);
	}
    }
    if (selected_objects.size() == 0 and !args.is_quiet) {
	log_warning("Couldn't find matching cell.\n");
    }
    return selected_objects;
}
