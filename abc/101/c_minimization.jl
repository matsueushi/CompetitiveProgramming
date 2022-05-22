parseints() = parse.(Int, split(readline()))

function main()
    n, k = parseints()
    as = parseints()
    println(cld(n - 1, k - 1))
end

main()
