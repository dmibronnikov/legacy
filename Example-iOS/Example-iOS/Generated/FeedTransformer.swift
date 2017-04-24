// Generated using Sourcery 0.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation
import CoreGraphics
import EEUtilities

// swiftlint:disable line_length
struct FeedTransformer: FullTransformer {
    typealias Source = Any
    typealias Destination = Feed

    let idName = "id"
    let titleName = "title"
    let descriptionName = "description"
    let createdName = "created"
    let authorName = "author"
    let tagsName = "tags"
    let likesName = "likes"

    let idTransformer = StringTransformer<Any>()
    let titleTransformer = StringTransformer<Any>()
    let descriptionTransformer = StringTransformer<Any>()
    let createdTransformer = DateTransformer<Any>()
    let authorTransformer = OptionalTransformer<StringTransformer<Any>>(valueTransformer: .init())
    let tagsTransformer = ArrayTransformer<Any, StringTransformer<Any>>(transformer: .init(), skipElements: true)
    let likesTransformer = NumberTransformer<Any, Int>()

    func convert(source value: Source) -> TransformerResult<Destination> {
        guard let dictionary: [String: Any] = CastTransformer().convert(source: value).value else { return .failure(.badDictionary) }

        let idResult = dictionary[idName].map(idTransformer.convert(source:)) ?? .failure(.requirement)
        let titleResult = dictionary[titleName].map(titleTransformer.convert(source:)) ?? .failure(.requirement)
        let descriptionResult = dictionary[descriptionName].map(descriptionTransformer.convert(source:)) ?? .failure(.requirement)
        let createdResult = dictionary[createdName].map(createdTransformer.convert(source:)) ?? .failure(.requirement)
        let authorResult = authorTransformer.convert(source: dictionary[authorName])
        let tagsResult = dictionary[tagsName].map(tagsTransformer.convert(source:)) ?? .failure(.requirement)
        let likesResult = dictionary[likesName].map(likesTransformer.convert(source:)) ?? .failure(.requirement)

        var errors: [(String, TransformerError)] = []
        idResult.error.map { errors.append((idName, $0)) }
        titleResult.error.map { errors.append((titleName, $0)) }
        descriptionResult.error.map { errors.append((descriptionName, $0)) }
        createdResult.error.map { errors.append((createdName, $0)) }
        authorResult.error.map { errors.append((authorName, $0)) }
        tagsResult.error.map { errors.append((tagsName, $0)) }
        likesResult.error.map { errors.append((likesName, $0)) }

        guard
            let id = idResult.value,
            let title = titleResult.value,
            let description = descriptionResult.value,
            let created = createdResult.value,
            let author = authorResult.value,
            let tags = tagsResult.value,
            let likes = likesResult.value,
            errors.isEmpty
        else {
            return .failure(.multiple(errors))
        }


        return .success(
            Destination(
                id: id,
                title: title,
                description: description,
                created: created,
                author: author,
                tags: tags,
                likes: likes
            )
        )
    }

    func convert(destination value: Destination) -> TransformerResult<Source> {
        let idResult = idTransformer.convert(destination: value.id)
        let titleResult = titleTransformer.convert(destination: value.title)
        let descriptionResult = descriptionTransformer.convert(destination: value.description)
        let createdResult = createdTransformer.convert(destination: value.created)
        let authorResult = authorTransformer.convert(destination: value.author)
        let tagsResult = tagsTransformer.convert(destination: value.tags)
        let likesResult = likesTransformer.convert(destination: value.likes)

        var errors: [(String, TransformerError)] = []
        idResult.error.map { errors.append((idName, $0)) }
        titleResult.error.map { errors.append((titleName, $0)) }
        descriptionResult.error.map { errors.append((descriptionName, $0)) }
        createdResult.error.map { errors.append((createdName, $0)) }
        authorResult.error.map { errors.append((authorName, $0)) }
        tagsResult.error.map { errors.append((tagsName, $0)) }
        likesResult.error.map { errors.append((likesName, $0)) }

        guard
            let id = idResult.value,
            let title = titleResult.value,
            let description = descriptionResult.value,
            let created = createdResult.value,
            let author = authorResult.value,
            let tags = tagsResult.value,
            let likes = likesResult.value,
            errors.isEmpty
        else {
            return .failure(.multiple(errors))
        }

        var dictionary: [String: Any] = [:]
        dictionary[idName] = id
        dictionary[titleName] = title
        dictionary[descriptionName] = description
        dictionary[createdName] = created
        dictionary[authorName] = author
        dictionary[tagsName] = tags
        dictionary[likesName] = likes
        return .success(dictionary)
    }
}
// swiftlint:enable line_length
