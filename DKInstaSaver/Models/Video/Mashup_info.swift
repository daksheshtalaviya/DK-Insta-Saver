/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import ObjectMapper

struct Mashup_info : Mappable {
	var mashups_allowed : Bool?
	var can_toggle_mashups_allowed : Bool?
	var has_been_mashed_up : Bool?
	var formatted_mashups_count : String?
	var original_media : String?
	var non_privacy_filtered_mashups_media_count : String?
	var mashup_type : String?
	var is_creator_requesting_mashup : Bool?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		mashups_allowed <- map["mashups_allowed"]
		can_toggle_mashups_allowed <- map["can_toggle_mashups_allowed"]
		has_been_mashed_up <- map["has_been_mashed_up"]
		formatted_mashups_count <- map["formatted_mashups_count"]
		original_media <- map["original_media"]
		non_privacy_filtered_mashups_media_count <- map["non_privacy_filtered_mashups_media_count"]
		mashup_type <- map["mashup_type"]
		is_creator_requesting_mashup <- map["is_creator_requesting_mashup"]
	}

}