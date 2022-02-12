const p = 10^9 + 7

function main()
    n = parse(Int64, readline())
    x = 1
    for i in 1:n
        ans = parse.(Int64, split(readline()))
        x *= sum(ans)
        x %= p
    end
    println(x)
end

main()
