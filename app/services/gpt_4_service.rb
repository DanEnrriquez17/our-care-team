require 'openai'

class Gpt4Service
  def initialize(client)
    @client = client
  end

  def content_recommendation(prescriptions)
    prescriptions_json = prescriptions.to_json
    prompt = "You will be a Medical expert, i will share a list of prescriptins.
    Please analyze the purpose of each one of them and give feedback on this data.
    Do not include numbers to separate each recommendation, instead, place an R: in front of each recommendation.
    Thank you.
    #{prescriptions_json}"


    response = @client.chat(
      parameters: {
        model: "gpt-3.5-turbo-16k", # Required.
        messages: [{ role: "user", content: prompt}], # Required.
        temperature: 0.7
        })


    return response.dig("choices", 0, "message", "content")
  end
end
