const M = 20

parseints() = parse.(Int, split(readline()))

function solve(n, k)
    count = zeros(Int, M)
    for i in 1:n
        c = i
        j = 0
        while c < k
            c <<= 1
            j += 1
        end
        count[j+1] += 1
    end

    res = 0
    for j in 1:M
        res += count[j] * 1 // (1 << (j - 1))
    end

    Float64(res // n)
end

function main()
    n, k = parseints()
    println(solve(n, k))
end

main()
