class FilterService
  class << self
    def call(params)
      if params.include? 'skill'
        User.skills_in(skill_set(params[:skill]))
      elsif params.include? 'project'
        User.on_project(params[:project])
      elsif params.include? 'holidays' && params[:holidays] == 'true'
        User.on_holidays
      elsif params.include? 'working' && params[:working] == 'true'
        User.on_working
      elsif params.include?('first_name') || params.include?('last_name')
        User.by_name(params[:first_name], params[:last_name])
      else
        User.all
      end
    end

    def skill_set(skills)
      skills = skills.gsub("[", "").gsub("]", "").split(', ')
      skills.map{|skill| "%#{skill}%"}
    end
  end
end
