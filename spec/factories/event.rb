FactoryBot.define  do
	factory :event do
		title{"テスト"}
		start{Time.zone.local(2019,10,28)}
	    add_attribute(:end){Time.zone.local(2019,10,29)}
	    fee{"2000円"}
	    venue{"国技館"}
	    address{"東京都"}
	    description{"あああ"}
	    access{"徒歩１０分"}
	    association :end_user

	    trait :invalid do
	    	title{ nil }
	    end
	end
end