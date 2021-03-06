class SeedQuestions < ActiveRecord::Migration
  HEALTH_QUESTIONS = [
    :experiences_joint_pain,
    :feel_distressed,
    :disruptive_fatigue,
    :pain_limits_daily_activities,
    :troubled_by_constipation,
    :experiences_hot_flashes_or_night_sweats_daily,
    :has_trouble_sleeping,
    :experiences_loss_of_interest_in_daily_activities,
    :wants_to_harm_self_or_others,
    :feels_anxiety_frequently,
    :memory_problems_interfere_with_daily_life,
    :has_unexplained_weight_loss,
    :has_been_recommended_low_fiber_diet,
    :has_had_gall_bladder_removed,
    :has_difficulty_swallowing,
    :has_lymphedema,
    :experiences_increased_size_of_legs_or_abdomen,
    :has_lower_than_desired_sexual_desire,
    :intercourse_is_painful,
    :has_insufficient_social_support,
    :experiences_diarrhea]

  PROFILE_QUESTIONS = [
    :cancer_type,
    :time_since_diagnosis,
    :received_chemotherapy,
    :received_radiation_therapy,
    :active_cancer,
    :metastatic_cancer,
    :receiving_cancer_treatment,
    :has_kidney_disease,
    :has_liver_disease,
    :has_congestive_heart_failure,
    :has_atrial_fibrillation,
    :has_dementia,
    :cannot_maintain_balance,
    :has_diabetes,
    :increased_bowel_obstruction_risk]

    SURVEY_QUESTIONS = [
      {"diet":"I limit the amount of refined carbohydrates in my diet.","question_id":1,"substrategy":"Unhealthy"},
      {"diet":"I do not eat processed foods.","question_id":2,"substrategy":"Unhealthy"},
      {"diet":"I do not eat foods made with white flour.","question_id":3,"substrategy":"Unhealthy"},
      {"diet":"I avoid drinking soda (diet or regular).","question_id":4,"substrategy":"Unhealthy"},
      {"diet":"I avoid eating sweets (candy, cookies, cake, pastries).","question_id":5,"substrategy":"Unhealthy"},
      {"diet":"I do not eat refined sugar.","question_id":6,"substrategy":"Unhealthy"},
      {"diet":"I do not add sweeteners to my food.","question_id":7,"substrategy":"Unhealthy"},
      {"diet":"I do not eat foods containing trans fats.","question_id":8,"substrategy":"Unhealthy"},
      {"diet":"I do not eat fast food.","question_id":9,"substrategy":"Unhealthy"},
      {"diet":"I do not eat pre-packaged foods.","question_id":11,"substrategy":"Unhealthy"},
      {"diet":"I consider my diet to be healthy.","question_id":12,"substrategy":"Healthy"},
      {"diet":"I base most of my food decisions on nutritional value of foods.","question_id":13,"substrategy":"Healthy"},
      {"diet":"The majority of my diet is organic.","question_id":14,"substrategy":"Healthy"},
      {"diet":"I eat legumes (beans, tofu) at least 3 days each week.","question_id":15,"substrategy":"Healthy"},
      {"diet":"I almost always eat at least 5 servings of vegetables every day (one serving is 1 cup of raw vegetables or one serving is ½ cup cooked vegetables).","question_id":16,"substrategy":"Healthy"},
      {"diet":"Most of my meals contain at least 5 (naturally occurring) colors.","question_id":17,"substrategy":"Healthy"},
      {"diet":"I emphasize fiber in my diet.","question_id":18,"substrategy":"Healthy"},
      {"diet":"I almost always eat olive oil every day.","question_id":19,"substrategy":"Healthy"},
      {"diet":"Not including salt or pepper, I almost always use spices when I cook.","question_id":20,"substrategy":"Healthy"},
      {"diet":"I eat fish at least 3 days each week.","question_id":21,"substrategy":"Healthy"},
      {"diet":"I eat nuts at least 3 days each week.","question_id":22,"substrategy":"Healthy"},
      {"diet":"I make an effort to include nuts in my daily diet.","question_id":23,"substrategy":"Healthy"},
      {"movement":"My physical strength is adequate for me to engage in my daily activities.","question_id":24,"substrategy":"Quality"},
      {"movement":"I enjoy exercising.","question_id":25,"substrategy":"Quality"},
      {"movement":"I am addicted to exercise.","question_id":26,"substrategy":"Quality"},
      {"movement":"I am satisfied with my physical activity level.","question_id":27,"substrategy":"Quality"},
      {"movement":"I am an endurance athlete.","question_id":28,"substrategy":"Quality"},
      {"movement":"I am physically fit.","question_id":29,"substrategy":"Quality"},
      {"movement":"I work up a sweat when I exercise.","question_id":30,"substrategy":"Quality"},
      {"movement":"I exercise at a level that makes carrying on a conversation difficult.","question_id":31,"substrategy":"Quality"},
      {"movement":"My exercise workouts are physically challenging for me.","question_id":32,"substrategy":"Quality"},
      {"movement":"I regularly do resistance exercise (for example, with weights or resistance bands).","question_id":33,"substrategy":"Quantity"},
      {"movement":"I spend time exercising outdoors.","question_id":34,"substrategy":"Quantity"},
      {"movement":"I exercise most days.","question_id":35,"substrategy":"Quantity"},
      {"movement":"I exercise every day.","question_id":36,"substrategy":"Quantity"},
      {"movement":"I walk for at least 30 minutes daily.","question_id":37,"substrategy":"Quantity"},
      {"movement":"I exercise for at least 30 minutes, five days a week.","question_id":38,"substrategy":"Quantity"},
      {"movement":"I do not allow myself to sit for more than 90 minutes without getting up to move around.","question_id":39,"substrategy":"Quantity"},
      {"movement":"I hardly ever sit still.","question_id":40,"substrategy":"Quantity"},
      {"environment":"I only use natural body care products.","question_id":41,"substrategy":"Environment"},
      {"environment":"I never use body care products with phthalates.","question_id":42,"substrategy":"Environment"},
      {"environment":"I never use body care products with parabens.","question_id":43,"substrategy":"Environment"},
      {"environment":"I only purchase organic skin care products.","question_id":44,"substrategy":"Environment"},
      {"environment":"I only use natural cleaning products in my home.","question_id":45,"substrategy":"Environment"},
      {"environment":"I feel that my home environment is non-toxic.","question_id":46,"substrategy":"Environment"},
      {"environment":"My home environment is quiet.","question_id":47,"substrategy":"Environment"},
      {"environment":"I think that using all natural, non-toxic products is critically important to health.","question_id":48,"substrategy":"Environment"},
      {"environment":"I only drink water out of ceramic, stainless steel or glass containers.","question_id":49,"substrategy":"Environment"},
      {"environment":"Whenever possible, I drink filtered water.","question_id":50,"substrategy":"Environment"},
      {"environment":"I only use BPA-free plastic containers and cans.","question_id":51,"substrategy":"Environment"},
      {"environment":"I never use tobacco products (cigarettes, cigar, chewing tobacco).","question_id":52,"substrategy":"Environment"},
      {"rejuvenation":"I have excellent ways to manage my stress.","question_id":53,"substrategy":"Stress"},
      {"rejuvenation":"I have very little stress in my life.","question_id":54,"substrategy":"Stress"},
      {"rejuvenation":"I am never distressed.","question_id":55,"substrategy":"Stress"},
      {"rejuvenation":"My stress level is manageable.","question_id":56,"substrategy":"Stress"},
      {"rejuvenation":"Stress is not a significant factor in my overall wellness","question_id":57,"substrategy":"Stress"},
      {"rejuvenation":"The stress that I experience is good for me.","question_id":58,"substrategy":"Stress"},
      {"rejuvenation":"I am not agitated by stressful situations.","question_id":59,"substrategy":"Stress"},
      {"rejuvenation":"I am never stressed.","question_id":60,"substrategy":"Stress"},
      {"rejuvenation":"When I am stressed, I know exactly what to do to relieve my stress.","question_id":61,"substrategy":"Stress"},
      {"rejuvenation":"My coping mechanisms for stress are healthy.","question_id":62,"substrategy":"Stress"},
      {"rejuvenation":"I am a calm person.","question_id":63,"substrategy":"Rest"},
      {"rejuvenation":"It is easy for me to relax.","question_id":64,"substrategy":"Rest"},
      {"rejuvenation":"I meditate at least three times every week.","question_id":65,"substrategy":"Rest"},
      {"rejuvenation":"I spend time in nature every week.","question_id":66,"substrategy":"Rest"},
      {"rejuvenation":"I enjoy listening to music.","question_id":67,"substrategy":"Rest"},
      {"rejuvenation":"I have daily hobbies that I enjoy.","question_id":68,"substrategy":"Rest"},
      {"rejuvenation":"I spend quality time with my loved ones every day.","question_id":69,"substrategy":"Rest"},
      {"rejuvenation":"I prioritize time with my loved ones.","question_id":70,"substrategy":"Rest"},
      {"rejuvenation":"I enjoy my job, or, if I don't work, I enjoy my daily activities.","question_id":71,"substrategy":"Rest"},
      {"rejuvenation":"Most days, I am doing exactly what I want to be doing.","question_id":72,"substrategy":"Rest"},
      {"rejuvenation":"I am never unhappy.","question_id":73,"substrategy":"Rest"},
      {"rejuvenation":"I am an honest person","question_id":74,"substrategy":"Rest"},
      {"spirit":"I laugh every day.","question_id":75,"substrategy":"Positive Attitude"},
      {"spirit":"I have friends.","question_id":76,"substrategy":"Positive Attitude"},
      {"spirit":"I am not afraid of having cancer diagnosed.","question_id":77,"substrategy":"Positive Attitude"},
      {"spirit":"I do not let my fear of cancer interfere with the quality of my life.","question_id":78,"substrategy":"Positive Attitude"},
      {"spirit":"I have an active spiritual practice.","question_id":79,"substrategy":"Positive Attitude"},
      {"spirit":"I feel grateful.","question_id":80,"substrategy":"Positive Attitude"},
      {"spirit":"I am optimistic.","question_id":81,"substrategy":"Positive Attitude"},
      {"spirit":"I feel loved.","question_id":82,"substrategy":"Positive Attitude"},
      {"spirit":"I love myself.","question_id":83,"substrategy":"Positive Attitude"},
      {"spirit":"I spend as much time with my friends as I want to.","question_id":84,"substrategy":"Community"},
      {"spirit":"I enjoy helping others.","question_id":85,"substrategy":"Community"},
      {"spirit":"I feel supported by others.","question_id":86,"substrategy":"Community"},
      {"spirit":"I feel connected to others.","question_id":87,"substrategy":"Community"},
      {"spirit":"I have a strong support network.","question_id":88,"substrategy":"Community"},
      {"spirit":"I feel that I am part of a community.","question_id":89,"substrategy":"Community"}
    ]

    PROFILE_QUESTIONS.each_with_index do |q,i|
      Question.create(name: q, sequence: i*10, type_of: 'profile')
    end

    HEALTH_QUESTIONS.each_with_index do |q,i|
      Question.create(name: q, sequence: i*10, type_of: 'health')
    end

    SURVEY_QUESTIONS.each_with_index do |q,i|
      Question.create(name: q.first[1], sequence: i*10, type_of: 'survey', strategy: q.first[0].to_s)
    end

end
