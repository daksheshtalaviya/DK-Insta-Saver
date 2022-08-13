/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import ObjectMapper

struct StoryFeedMedia : Mappable {
	var x : Double?
	var y : Double?
	var z : Int?
	var width : Double?
	var height : Double?
	var rotation : Int?
	var is_pinned : Int?
	var is_hidden : Int?
	var is_sticker : Int?
	var is_fb_sticker : Int?
	var media_id : String?
	var product_type : String?
	var media_code : String?
	var clips_creation_entry_point : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		x <- map["x"]
		y <- map["y"]
		z <- map["z"]
		width <- map["width"]
		height <- map["height"]
		rotation <- map["rotation"]
		is_pinned <- map["is_pinned"]
		is_hidden <- map["is_hidden"]
		is_sticker <- map["is_sticker"]
		is_fb_sticker <- map["is_fb_sticker"]
		media_id <- map["media_id"]
		product_type <- map["product_type"]
		media_code <- map["media_code"]
		clips_creation_entry_point <- map["clips_creation_entry_point"]
	}

}
