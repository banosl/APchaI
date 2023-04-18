class TeaSerializer
  def format_tea(tea)
    {
      "data": {
        "type": "tea",
        "id": tea[:id],
        "attributes": {
          "title": tea[:title],
          "description": tea[:description],
          "temperature": "#{tea[:temperature]} F",
          "brew_time": tea[:brew_time]
        }
      }
    }
  end
end