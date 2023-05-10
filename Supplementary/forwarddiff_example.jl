using ForwardDiff

f(x) = 3 + x * log(x^2)

@show ForwardDiff.derivative(f, 5)  # 5.218875824868201
