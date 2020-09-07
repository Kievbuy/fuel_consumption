class Float
  def round_down(num = 0)
    s = to_s
    l = s.index('.') + 1 + num
    s.length <= l ? self : s[0, l].to_f
  end
end
