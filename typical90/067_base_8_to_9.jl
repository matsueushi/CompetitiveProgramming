function basechange(n)
    n8 = 0
    i = 1
    for x in n
        n8 += i * x
        i *= 8
    end
    i = 1
    n9 = Int64[]
    while n8 > 0
        n8, r = divrem(n8, 9)
        push!(n9, r == 8 ? 5 : r)
    end
    n9
end

function solve(n, k)
    m = reverse(parse.(Int64, split(n, "")))
    for _ in 1:k
        m = basechange(m)
    end
    isempty(m) ? 0 : join(reverse(m), "")
end

function main()
    n, k = split(readline())
    println(solve(n, parse(Int64, k)))
end

main()
