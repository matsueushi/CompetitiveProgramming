parseints() = parse.(Int, split(readline()))

function solve(n, k, ps)
    pmax = pcur = sum(@view ps[1:k])
    for i in 1:n-k
        pcur = pcur - ps[i] + ps[i+k]
        pmax = max(pmax, pcur)
    end
    (pmax + k) / 2
end

function main()
    n, k = parseints()
    ps = parseints()
    println(solve(n, k, ps))
end

main()