/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import ObjectMapper

struct Media : Mappable {
    
    enum MediaType : Int {
        case image   = 1
        case video    = 2
        case multiple = 8
        
    }
    
    var taken_at : Int?
    var pk : Int?
    var id : String?
    var device_timestamp : Int?
    var media_type : MediaType?
    var code : String?
    var client_cache_key : String?
    var filter_type : Int?
    var is_unified_video : Bool?
    var location : Location?
    var lat : Double?
    var lng : Double?
    var should_request_ads : Bool?
    var caption_is_edited : Bool?
    var like_and_view_counts_disabled : Bool?
    var commerciality_status : String?
    var is_paid_partnership : Bool?
    var is_visual_reply_commenter_notice_enabled : Bool?
    var original_media_has_visual_reply_media : Bool?
    var has_delayed_metadata : Bool?
    var comment_likes_enabled : Bool?
    var comment_threading_enabled : Bool?
    var has_more_comments : Bool?
    var next_max_id : Int?
    var max_num_visible_preview_comments : Int?
    var preview_comments : [PreviewComments]?
    var comments : [Comments]?
    var can_view_more_preview_comments : Bool?
    var comment_count : Int?
    var commenting_disabled_for_viewer : Bool?
    var hide_view_all_comment_entrypoint : Bool?
    var inline_composer_display_condition : String?
    var thumbnails : Thumbnails?
    var image_versions2 : ImageVersions2?
    var original_width : Int?
    var original_height : Int?
    var user : User?
    var can_viewer_reshare : Bool?
    var like_count : Int?
    var has_liked : Bool?
    var top_likers : [String]?
    var facepile_top_likers : [String]?
    var photo_of_you : Bool?
    var is_organic_product_tagging_eligible : Bool?
    var can_see_insights_as_brand : Bool?
    var mashup_info : Mashup_info?
    var is_dash_eligible : Int?
    var video_dash_manifest : String?
    var video_codec : String?
    var number_of_qualities : Int?
    var video_versions : [VideoVersions]?
    var has_audio : Bool?
    var video_duration : Double?
    var view_count : Int?
    var caption : Caption?
    var featured_products_cta : String?
    var comment_inform_treatment : CommentInformTreatment?
    var sharing_friction_info : SharingFrictionInfo?
    var can_viewer_save : Bool?
    var is_in_profile_grid : Bool?
    var profile_grid_control_enabled : Bool?
    var organic_tracking_token : String?
    var has_shared_to_fb : Int?
    var product_type : String?
    var deleted_reason : Int?
    var integrity_review_decision : String?
    var commerce_integrity_review_decision : String?
    var music_metadata : MusicMetadata?

	init?(map: Map) {

	}

    mutating func mapping(map: Map) {
        
        taken_at <- map["taken_at"]
        pk <- map["pk"]
        id <- map["id"]
        device_timestamp <- map["device_timestamp"]
        media_type <- map["media_type"]
        code <- map["code"]
        client_cache_key <- map["client_cache_key"]
        filter_type <- map["filter_type"]
        is_unified_video <- map["is_unified_video"]
        location <- map["location"]
        lat <- map["lat"]
        lng <- map["lng"]
        should_request_ads <- map["should_request_ads"]
        caption_is_edited <- map["caption_is_edited"]
        like_and_view_counts_disabled <- map["like_and_view_counts_disabled"]
        commerciality_status <- map["commerciality_status"]
        is_paid_partnership <- map["is_paid_partnership"]
        is_visual_reply_commenter_notice_enabled <- map["is_visual_reply_commenter_notice_enabled"]
        original_media_has_visual_reply_media <- map["original_media_has_visual_reply_media"]
        has_delayed_metadata <- map["has_delayed_metadata"]
        comment_likes_enabled <- map["comment_likes_enabled"]
        comment_threading_enabled <- map["comment_threading_enabled"]
        has_more_comments <- map["has_more_comments"]
        next_max_id <- map["next_max_id"]
        max_num_visible_preview_comments <- map["max_num_visible_preview_comments"]
        preview_comments <- map["preview_comments"]
        comments <- map["comments"]
        can_view_more_preview_comments <- map["can_view_more_preview_comments"]
        comment_count <- map["comment_count"]
        commenting_disabled_for_viewer <- map["commenting_disabled_for_viewer"]
        hide_view_all_comment_entrypoint <- map["hide_view_all_comment_entrypoint"]
        inline_composer_display_condition <- map["inline_composer_display_condition"]
        thumbnails <- map["thumbnails"]
        image_versions2 <- map["image_versions2"]
        original_width <- map["original_width"]
        original_height <- map["original_height"]
        user <- map["user"]
        can_viewer_reshare <- map["can_viewer_reshare"]
        like_count <- map["like_count"]
        has_liked <- map["has_liked"]
        top_likers <- map["top_likers"]
        facepile_top_likers <- map["facepile_top_likers"]
        photo_of_you <- map["photo_of_you"]
        is_organic_product_tagging_eligible <- map["is_organic_product_tagging_eligible"]
        can_see_insights_as_brand <- map["can_see_insights_as_brand"]
        mashup_info <- map["mashup_info"]
        is_dash_eligible <- map["is_dash_eligible"]
        video_dash_manifest <- map["video_dash_manifest"]
        video_codec <- map["video_codec"]
        number_of_qualities <- map["number_of_qualities"]
        video_versions <- map["video_versions"]
        has_audio <- map["has_audio"]
        video_duration <- map["video_duration"]
        view_count <- map["view_count"]
        caption <- map["caption"]
        featured_products_cta <- map["featured_products_cta"]
        comment_inform_treatment <- map["comment_inform_treatment"]
        sharing_friction_info <- map["sharing_friction_info"]
        can_viewer_save <- map["can_viewer_save"]
        is_in_profile_grid <- map["is_in_profile_grid"]
        profile_grid_control_enabled <- map["profile_grid_control_enabled"]
        organic_tracking_token <- map["organic_tracking_token"]
        has_shared_to_fb <- map["has_shared_to_fb"]
        product_type <- map["product_type"]
        deleted_reason <- map["deleted_reason"]
        integrity_review_decision <- map["integrity_review_decision"]
        commerce_integrity_review_decision <- map["commerce_integrity_review_decision"]
        music_metadata <- map["music_metadata"]
    }

}

extension Media {
    
    var originalVideoVersion: VideoVersions? {
        video_versions?.max(by: { item1, item2 in
            if let width1 = item1.width,
               let height1 = item1.height,
               let width2 = item2.width,
               let height2 = item2.height {
                
                if width1 < height1 {
                    return height1 < height2
                } else {
                    return width1 < width2
                }
            }
            
            return false
        })
    }
}

extension Array where Element == Media {
    
    var getUrls: [String] {
        self.compactMap { media in
            switch media.media_type {
            case .image:
                return media.image_versions2?.originalCandidate?.url
            case .video:
                return media.originalVideoVersion?.url
            case .multiple:
                return nil
            default: return nil
            }
        }
    }
}
