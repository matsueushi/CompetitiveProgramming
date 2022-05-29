parseints() = parse.(Int, split(readline()))

function main()
    n, k = parseints()
    println(k * (k - 1)^(n - 1))
end

main()
