parseints() = parse.(Int, split(readline()))

function good(n, dset)
    while n > 0
        n % 10 ∈ dset && return false
        n ÷= 10
    end
    true
end

function solve(n, k, ds)
    dset = Set(ds)
    while true
        good(n, dset) && return n
        n += 1
    end
end

function main()
    n, k = parseints()
    ds = parseints()
    println(solve(n, k, ds))
end

main()
