/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com


*/

import Foundation
struct BaseData : Codable {
	let data : [ResData]?

	enum CodingKeys: String, CodingKey {

		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		data = try values.decodeIfPresent([ResData].self, forKey: .data)
	}

}
