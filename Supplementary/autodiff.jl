struct Dual{T}
    a::T
    b::T
end

# Приведение типов.
Base.convert(::Type{<:Dual}, x::Real) = Dual(x, zero(x))
Base.promote_rule(::Type{Dual{T}}, ::Type{S}) where {T,S} = Dual{promote_type(T, S)}

Base.:+(x::Dual, y::Real) = +(promote(x, y)...)
Base.:+(x::Real, y::Dual) = +(promote(x, y)...)

# Перегрузка +, * и ^.
Base.:+(x::Dual, y::Dual) = Dual(x.a + y.a, x.b + y.b)
Base.:*(x::Dual, y::Dual) = Dual(x.a * y.a, x.b * y.a + x.a * y.b)
Base.:^(x::Dual, n::Int) = Dual(x.a^n, x.b * n * x.a^(n-1))

# Перегрузка логарифма.
Base.log(x::Dual) = Dual(log(x.a), x.b / x.a)

f(x) = 3 + x * log(x^2)
df(x) = 2 + log(x^2)

@show f(Dual(5, 1))  # Dual{Float64}(19.094379124341003, 5.218875824868201)
@show f(5)           # 19.094379124341003
@show df(5)          # 5.218875824868201
