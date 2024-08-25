export const API_URL = "https://gcp-demo-node-3tczl25ztq-uc.a.run.app";

/**
 * Sends a POST request to the backend to get a response from the AI.
 * @param {string} question - The question to send to the AI.
 * @returns {Promise<string>}
 */
export const getAIResponse = async (question) => {
  try {
    const response = await fetch(`${API_URL}/fast/response`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ question }),
    });

    if (!response.ok) {
      throw new Error("Failed to fetch response from the server");
    }

    const data = await response.json();
    return data.response;
  } catch (error) {
    console.error("Error fetching AI response:", error);
    return "An error occurred while processing your request.";
  }
};
