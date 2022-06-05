parseint() = parse(Int, readline())

const P = 10^9 + 7

function solve(n, ss)
    res = 1
    for c in 'a':'z'
        m = 0
        for i in 1:n
            ss[i] == c && (m += 1)
        end
        res = (res * (m + 1)) % P
    end
    res - 1
end

function main()
    n = parseint()
    s = readline()
    println(solve(n, s))
end

main()
