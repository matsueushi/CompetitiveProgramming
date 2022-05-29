parseints() = parse.(Int, split(readline()))

function main()
    a, b, c = parseints()
    res = typemax(Int)
    res = min(res, ifelse(iseven(a), 0, b * c))
    res = min(res, ifelse(iseven(b), 0, a * c))
    res = min(res, ifelse(iseven(c), 0, a * b))
    println(res)
end

main()
