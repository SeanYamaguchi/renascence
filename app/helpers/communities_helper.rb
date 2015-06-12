module CommunitiesHelper
	def nested_communities(communities)
		communities.map do |community, sub_communities|
			render(community) + content_tag(:div, ested_communities(sub_communities), :class => "nested_communities")
		end.join.html_safe
	end
end
