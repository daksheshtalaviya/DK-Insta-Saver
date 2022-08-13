/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import ObjectMapper

struct Location : Mappable {
	var pk : Int?
	var short_name : String?
	var facebook_places_id : Int?
	var external_source : String?
	var name : String?
	var address : String?
	var city : String?
	var has_viewer_saved : Bool?
	var lng : Double?
	var lat : Double?
	var is_eligible_for_guides : Bool?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		pk <- map["pk"]
		short_name <- map["short_name"]
		facebook_places_id <- map["facebook_places_id"]
		external_source <- map["external_source"]
		name <- map["name"]
		address <- map["address"]
		city <- map["city"]
		has_viewer_saved <- map["has_viewer_saved"]
		lng <- map["lng"]
		lat <- map["lat"]
		is_eligible_for_guides <- map["is_eligible_for_guides"]
	}

}