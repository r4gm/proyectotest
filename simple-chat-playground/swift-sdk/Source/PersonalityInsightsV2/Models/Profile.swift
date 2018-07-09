/**
 * Copyright IBM Corporation 2016
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import Foundation

/** A personality profile generated by the Personality Insights service. */
public struct Profile: JSONDecodable {

    /// Detailed results for a specific characteristic of the input text.
    public let tree: TraitTreeNode

    /// The unique identifier for which these characteristics were computed,
    /// from the "userid" field of the input ContentItems.
    public let id: String

    /// The source for which these characteristics were computed,
    /// from the "sourceid" field of the input ContentItems.
    public let source: String

    /// The number of words found in the input.
    public let wordCount: Int

    /// A message indicating the number of words found and where the value falls
    /// in the range of required or suggested number of words when guidance is
    /// available.
    public let wordCountMessage: String?

    /// The language model that was used to process the input.
    public let processedLanguage: String

    /// Used internally to initialize a `Profile` model from JSON.
    public init(json: JSONWrapper) throws {
        tree = try json.decode(at: "tree")
        id = try json.getString(at: "id")
        source = try json.getString(at: "source")
        wordCount = try json.getInt(at: "word_count")
        wordCountMessage = try? json.getString(at: "word_count_message")
        processedLanguage = try json.getString(at: "processed_lang")
    }
}