parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, cs, ss, fs)
    for i in 1:n
        t = 0
        for j in i:n-1
            t = max(ss[j], cld(t, fs[j]) * fs[j])
            t += cs[j]
        end
        println(t)
    end
end

function main()
    n = parseint()
    cs, ss, fs = zeros(Int, n - 1), zeros(Int, n - 1), zeros(Int, n - 1)
    for i in 1:n-1
        cs[i], ss[i], fs[i] = parseints()
    end
    solve(n, cs, ss, fs)
end

main()
