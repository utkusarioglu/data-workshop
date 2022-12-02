from greeting_utils import returns_greeting

def test_returns_greeting():
  response = returns_greeting()
  expected = "Hello there"
  assert(expected == response)
