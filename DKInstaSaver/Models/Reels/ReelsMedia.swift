/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import ObjectMapper

struct ReelsMedia : Mappable {
    
	var id : Int?
	var latest_reel_media : Int?
	var expiring_at : Int?
	var seen : Int?
	var can_reply : Bool?
	var can_gif_quick_reply : Bool?
	var can_reshare : Bool?
	var can_react_with_avatar : Bool?
	var reel_type : String?
	var ad_expiry_timestamp_in_millis : String?
	var is_cta_sticker_available : String?
	var user : User?
	var items : [Media]?
	var prefetch_count : Int?
	var media_count : Int?
	var media_ids : [String]?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		latest_reel_media <- map["latest_reel_media"]
		expiring_at <- map["expiring_at"]
		seen <- map["seen"]
		can_reply <- map["can_reply"]
		can_gif_quick_reply <- map["can_gif_quick_reply"]
		can_reshare <- map["can_reshare"]
		can_react_with_avatar <- map["can_react_with_avatar"]
		reel_type <- map["reel_type"]
		ad_expiry_timestamp_in_millis <- map["ad_expiry_timestamp_in_millis"]
		is_cta_sticker_available <- map["is_cta_sticker_available"]
		user <- map["user"]
		items <- map["items"]
		prefetch_count <- map["prefetch_count"]
		media_count <- map["media_count"]
		media_ids <- map["media_ids"]
	}

}
