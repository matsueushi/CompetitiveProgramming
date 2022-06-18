parseints() = parse.(Int, split(readline()))

function main()
    a, b, c, d = parseints()
    println(max(a * b, c * d))
end

main()
