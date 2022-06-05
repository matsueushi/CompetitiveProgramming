parseints() = parse.(Int, split(readline()))

function main()
    m = 10^9
    n, k, s = parseints()
    if s != m
        xs = fill(m, n)
        xs[1:k] .= s
    else
        xs = ones(Int, n)
        xs[1:k] .= s
    end
    println(join(xs, " "))
end

main()
