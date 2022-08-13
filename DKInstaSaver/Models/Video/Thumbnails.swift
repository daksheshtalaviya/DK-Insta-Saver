/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import ObjectMapper

struct Thumbnails : Mappable {
	var video_length : Double?
	var thumbnail_width : Int?
	var thumbnail_height : Int?
	var thumbnail_duration : Double?
	var sprite_urls : [String]?
	var thumbnails_per_row : Int?
	var total_thumbnail_num_per_sprite : Int?
	var max_thumbnails_per_sprite : Int?
	var sprite_width : Int?
	var sprite_height : Int?
	var rendered_width : Int?
	var file_size_kb : Int?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		video_length <- map["video_length"]
		thumbnail_width <- map["thumbnail_width"]
		thumbnail_height <- map["thumbnail_height"]
		thumbnail_duration <- map["thumbnail_duration"]
		sprite_urls <- map["sprite_urls"]
		thumbnails_per_row <- map["thumbnails_per_row"]
		total_thumbnail_num_per_sprite <- map["total_thumbnail_num_per_sprite"]
		max_thumbnails_per_sprite <- map["max_thumbnails_per_sprite"]
		sprite_width <- map["sprite_width"]
		sprite_height <- map["sprite_height"]
		rendered_width <- map["rendered_width"]
		file_size_kb <- map["file_size_kb"]
	}

}