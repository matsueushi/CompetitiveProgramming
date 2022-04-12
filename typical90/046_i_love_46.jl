const N = 46

function solve(n, as, bs, cs)
    asm = zeros(Int64, N)
    bsm = zero(asm)
    csm = zero(asm)
    for (a, b, c) in zip(as, bs, cs)
        asm[1+a%N] += 1
        bsm[1+b%N] += 1
        csm[1+c%N] += 1
    end
    ans = 0
    for i in 0:N-1
        for j in 0:N-1
            ans += asm[1+i] * bsm[1+j] * csm[1+mod(N - i - j, N)]
        end
    end
    ans
end

function main()
    n = parse(Int64, readline())
    as = parse.(Int64, split(readline()))
    bs = parse.(Int64, split(readline()))
    cs = parse.(Int64, split(readline()))
    println(solve(n, as, bs, cs))
end

main()
