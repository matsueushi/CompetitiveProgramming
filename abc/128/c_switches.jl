parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, m, ks, ss, ps)
    res = 0
    count = zeros(Int, m)
    for i in 0:1<<n-1
        fill!(count, 0)
        for j in 1:n
            if i >> (j - 1) & 1 == 1
                for u in 1:m
                    j ∈ ss[u] && (count[u] += 1)
                end
            end
        end

        valid = true
        for v in 1:m
            count[v] % 2 != ps[v] && (valid = false; continue)
        end
        valid && (res += 1)
    end
    res
end

function main()
    n, m = parseints()
    ks = zeros(Int, m)
    ss = Set{Int}[]
    for i in 1:m
        ins = parseints()
        ks[i] = ins[1]
        push!(ss, Set(ins[2:end]))
    end
    ps = parseints()
    println(solve(n, m, ks, ss, ps))
end

main()
