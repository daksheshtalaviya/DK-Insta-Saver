
import Foundation
import ObjectMapper

struct Posts : Mappable {
    
	var items : [Media]?
	var num_results : Int?
	var more_available : Bool?
	var next_max_id : String?
	var user : User?
	var auto_load_more_enabled : Bool?
	var status : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		items <- map["items"]
		num_results <- map["num_results"]
		more_available <- map["more_available"]
		next_max_id <- map["next_max_id"]
		user <- map["user"]
		auto_load_more_enabled <- map["auto_load_more_enabled"]
		status <- map["status"]
	}

}
