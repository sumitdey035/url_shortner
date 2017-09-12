module UrlShortner
  CHARSET     = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  BASE        = 62
  CODE_LENGTH = 6

  def encode(id)
    code = ""
    while (id > 0) do
      code = CHARSET[id % BASE].chr + code
      id = id / BASE
    end

    (code.length > CODE_LENGTH) ? "" : "0" * (CODE_LENGTH - code.length) + code
  end

  # def decode(code)
  #   return -1 if code.length != CODE_LENGTH
  #   id = 0
  #   for i in 0..(CODE_LENGTH-1) do
  #     n = CHARSET.index(code[i])
  #     return -1 if n.nil?
  #     id += n * (BASE ** (CODE_LENGTH - i - 1))
  #   end
  #   return id
  # end
end