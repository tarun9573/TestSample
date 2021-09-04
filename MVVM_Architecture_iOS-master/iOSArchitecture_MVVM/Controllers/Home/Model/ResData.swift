/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

*/

import Foundation
struct ResData : Codable {
	let item_type : String?
	let data : String?

	enum CodingKeys: String, CodingKey {

		case item_type = "item_type"
		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		item_type = try values.decodeIfPresent(String.self, forKey: .item_type)
		data = try values.decodeIfPresent(String.self, forKey: .data)
	}

}
