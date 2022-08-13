/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import ObjectMapper

struct PreviewComments : Mappable {
	var pk : Int?
	var user_id : Int?
	var text : String?
	var type : Int?
	var created_at : Int?
	var created_at_utc : Int?
	var content_type : String?
	var status : String?
	var bit_flags : Int?
	var did_report_as_spam : Bool?
	var share_enabled : Bool?
	var user : User?
	var is_covered : Bool?
	var media_id : Int?
	var parent_comment_id : Int?
	var has_liked_comment : Bool?
	var comment_like_count : Int?
	var private_reply_status : Int?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		pk <- map["pk"]
		user_id <- map["user_id"]
		text <- map["text"]
		type <- map["type"]
		created_at <- map["created_at"]
		created_at_utc <- map["created_at_utc"]
		content_type <- map["content_type"]
		status <- map["status"]
		bit_flags <- map["bit_flags"]
		did_report_as_spam <- map["did_report_as_spam"]
		share_enabled <- map["share_enabled"]
		user <- map["user"]
		is_covered <- map["is_covered"]
		media_id <- map["media_id"]
		parent_comment_id <- map["parent_comment_id"]
		has_liked_comment <- map["has_liked_comment"]
		comment_like_count <- map["comment_like_count"]
		private_reply_status <- map["private_reply_status"]
	}

}
