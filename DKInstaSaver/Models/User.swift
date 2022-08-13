/*
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import ObjectMapper

struct User : Mappable {
    
    var id : String?
    var biography : String?
    var bio_links : [String]?
    var biography_with_entities : [String : Any]?
    var blocked_by_viewer : Bool?
    var restricted_by_viewer : Bool?
    var country_block : Bool?
    var external_url : String?
    var external_url_linkshimmed : String?
    var edge_followed_by : [String : Any]?
    var fbid : String?
    var followed_by_viewer : Bool?
    var edge_follow : [String : Any]?
    var follows_viewer : Bool?
    var full_name : String?
    var group_metadata : String?
    var has_ar_effects : Bool?
    var has_clips : Bool?
    var has_guides : Bool?
    var has_channel : Bool?
    var has_blocked_viewer : Bool?
    var highlight_reel_count : Int?
    var has_requested_viewer : Bool?
    var hide_like_and_view_counts : Bool?
    var is_business_account : Bool?
    var is_eligible_to_view_account_transparency : Bool?
    var is_professional_account : Bool?
    var is_supervision_enabled : Bool?
    var is_guardian_of_viewer : Bool?
    var is_supervised_by_viewer : Bool?
    var is_supervised_user : Bool?
    var is_embeds_disabled : Bool?
    var is_joined_recently : Bool?
    var guardian_id : String?
    var business_address_json : String?
    var business_contact_method : String?
    var business_email : String?
    var business_phone_number : String?
    var business_category_name : String?
    var overall_category_name : String?
    var category_enum : String?
    var category_name : String?
    var is_private : Bool?
    var is_verified : Bool?
    var edge_mutual_followed_by : [String : Any]?
    var profile_pic_url : String?
    var profile_pic_url_hd : String?
    var requested_by_viewer : Bool?
    var should_show_category : Bool?
    var should_show_public_contacts : Bool?
    var state_controlled_media_country : String?
    var location_transparency_country : String?
    var transparency_label : String?
    var transparency_product : String?
    var username : String?
    var connected_fb_page : String?
    var pronouns : [String]?
    var edge_felix_video_timeline : [String : Any]?
    var edge_owner_to_timeline_media : [String : Any]?
    var edge_saved_media : [String : Any]?
    var edge_media_collections : [String : Any]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        biography <- map["biography"]
        bio_links <- map["bio_links"]
        biography_with_entities <- map["biography_with_entities"]
        blocked_by_viewer <- map["blocked_by_viewer"]
        restricted_by_viewer <- map["restricted_by_viewer"]
        country_block <- map["country_block"]
        external_url <- map["external_url"]
        external_url_linkshimmed <- map["external_url_linkshimmed"]
        edge_followed_by <- map["edge_followed_by"]
        fbid <- map["fbid"]
        followed_by_viewer <- map["followed_by_viewer"]
        edge_follow <- map["edge_follow"]
        follows_viewer <- map["follows_viewer"]
        full_name <- map["full_name"]
        group_metadata <- map["group_metadata"]
        has_ar_effects <- map["has_ar_effects"]
        has_clips <- map["has_clips"]
        has_guides <- map["has_guides"]
        has_channel <- map["has_channel"]
        has_blocked_viewer <- map["has_blocked_viewer"]
        highlight_reel_count <- map["highlight_reel_count"]
        has_requested_viewer <- map["has_requested_viewer"]
        hide_like_and_view_counts <- map["hide_like_and_view_counts"]
        id <- map["id"]
        is_business_account <- map["is_business_account"]
        is_eligible_to_view_account_transparency <- map["is_eligible_to_view_account_transparency"]
        is_professional_account <- map["is_professional_account"]
        is_supervision_enabled <- map["is_supervision_enabled"]
        is_guardian_of_viewer <- map["is_guardian_of_viewer"]
        is_supervised_by_viewer <- map["is_supervised_by_viewer"]
        is_supervised_user <- map["is_supervised_user"]
        is_embeds_disabled <- map["is_embeds_disabled"]
        is_joined_recently <- map["is_joined_recently"]
        guardian_id <- map["guardian_id"]
        business_address_json <- map["business_address_json"]
        business_contact_method <- map["business_contact_method"]
        business_email <- map["business_email"]
        business_phone_number <- map["business_phone_number"]
        business_category_name <- map["business_category_name"]
        overall_category_name <- map["overall_category_name"]
        category_enum <- map["category_enum"]
        category_name <- map["category_name"]
        is_private <- map["is_private"]
        is_verified <- map["is_verified"]
        edge_mutual_followed_by <- map["edge_mutual_followed_by"]
        profile_pic_url <- map["profile_pic_url"]
        profile_pic_url_hd <- map["profile_pic_url_hd"]
        requested_by_viewer <- map["requested_by_viewer"]
        should_show_category <- map["should_show_category"]
        should_show_public_contacts <- map["should_show_public_contacts"]
        state_controlled_media_country <- map["state_controlled_media_country"]
        location_transparency_country <- map["location_transparency_country"]
        transparency_label <- map["transparency_label"]
        transparency_product <- map["transparency_product"]
        username <- map["username"]
        connected_fb_page <- map["connected_fb_page"]
        pronouns <- map["pronouns"]
        edge_felix_video_timeline <- map["edge_felix_video_timeline"]
        edge_owner_to_timeline_media <- map["edge_owner_to_timeline_media"]
        edge_saved_media <- map["edge_saved_media"]
        edge_media_collections <- map["edge_media_collections"]
    }

}
