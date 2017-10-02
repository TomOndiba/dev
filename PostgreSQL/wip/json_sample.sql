select
	row_to_json(t)
from
	(
		select
			  text
			, pronunciation
			, (
					select
						array_to_json( array_agg(row_to_json(d)))
					from
						(
							select
								  part_of_speech
								, body
							from
								definitions
							where
								word_id = words.id
							order by
								position asc
						) d
			  ) as definitions
			, (
					select
						array_to_json( array_agg(row_to_json(q)) )
					from
						(
							select
								body,
								source
							from
								quotes
							where
								word_id = words.id
						) q
			  ) as quotes
			, (
					select
						array_to_json( array_agg(text) )
					from
						words related_words
					join word_relationships
						on related_words.id = word_relationships.destination_id
					where
							source_id = words.id
						and relationship = 'synonym'
			  ) as synonyms
			, (
					select
						array_to_json(array_agg(text) )
					from
						words related_words
					join word_relationships
						on related_words.id = word_relationships.destination_id
					where
							source_id = words.id
						and relationship = 'antonym'
			  ) as antonyms
		from
			words
		where
			text = 'some_value'
	) t