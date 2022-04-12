const p = 10^9 + 7

function solve(n, l)
    xs = zeros(Int64, n + 1)
    xs[1:min(l, n + 1)] .= 1
    for i in l+1:n+1
        xs[i] = (xs[i-1] + xs[i-l]) % p
    end
    last(xs)
end

function main()
    n, l = parse.(Int64, split(readline()))
    println(solve(n, l))
end

main()
