import requests
from tenacity import retry, stop_after_attempt, wait_fixed
from utils.errors import APIRequestError, setup_logging

logger = setup_logging()

@retry(stop=stop_after_attempt(3), wait=wait_fixed(2))
def fetch_data(url):
    """Fetches data from an external API with error handling and retry logic."""
    try:
        response = requests.get(url, timeout=5)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.HTTPError as e:
        logger.error("HTTP error occurred: %s", e)
        raise APIRequestError(f"HTTP error: {e}")
    except requests.exceptions.ConnectionError:
        logger.error("Failed to connect to the server.")
        raise APIRequestError("Connection failed.")
    except requests.exceptions.Timeout:
        logger.error("Request timed out.")
        raise APIRequestError("Request timed out.")
    except requests.exceptions.RequestException as e:
        logger.error("General API error: %s", e)
        raise APIRequestError(f"API request failed: {e}")