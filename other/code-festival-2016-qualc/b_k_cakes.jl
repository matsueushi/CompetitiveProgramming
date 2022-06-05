parseints() = parse.(Int, split(readline()))

function main()
    k, t = parseints()
    as = parseints()
    asum = sum(as)
    m = maximum(as)
    println(max(0, m - 1 - (asum - m)))
end

main()
