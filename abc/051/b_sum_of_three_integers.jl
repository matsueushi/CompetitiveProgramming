parseints() = parse.(Int, split(readline()))

function solve(k, s)
    res = 0
    for i in 0:k
        for j in 0:k
            0 ≤ s - i - j ≤ k && (res += 1)
        end
    end
    res
end

function main()
    k, s = parseints()
    println(solve(k, s))
end

main()
