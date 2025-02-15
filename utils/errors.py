import logging

class MissingConfigError(Exception):
    """Raised when a required configuration is missing or invalid."""
    pass

class APIRequestError(Exception):
    """Raised for failures in API requests."""
    pass

def setup_logging():
    """Configure logging for the application."""
    logging.basicConfig(
        level=logging.INFO,
        filename="app.log",
        filemode="a",
        format="%(asctime)s - %(levelname)s - %(message)s"
    )
    return logging.getLogger(__name__)