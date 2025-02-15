def safe_divide(a, b):
    """Performs safe division, preventing division by zero errors."""
    if b == 0:
        raise ValueError("Denominator cannot be zero.")
    return a / b