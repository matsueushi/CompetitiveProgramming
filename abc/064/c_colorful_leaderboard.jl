function solve(n, as)
    used = falses(8)
    over = 0
    for i in 1:n
        a = as[i]
        c = a ÷ 400
        if c < 8
            used[c+1] = true
        else
            over += 1
        end
    end
    s = sum(used)
    max(1, s), s + over
end

function main()
    n = parse(Int, readline())
    as = parse.(Int, split(readline()))
    println(join(solve(n, as), " "))
end

main()
