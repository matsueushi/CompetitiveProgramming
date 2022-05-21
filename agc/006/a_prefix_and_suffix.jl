parseint() = parse(Int, readline())

function solve(n, s, t)
    for i in 1:n
        if s[i:end] == t[1:n-i+1]
            return n + i - 1
        end
    end
    2 * n
end

function main()
    n = parseint()
    s = readline()
    t = readline()
    println(solve(n, s, t))
end

main()
