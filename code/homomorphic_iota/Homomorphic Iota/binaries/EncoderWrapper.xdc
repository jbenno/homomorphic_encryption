<?xml version="1.0"?><doc>
<members>
<member name="F:seal.util.global_variables.default_coeff_modulus_128" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\util\globals.h" line="24">
This data structure is a key-value storage that maps degrees of the polynomial modulus
to vectors of SmallModulus elements so that when used with the default value for the
standard deviation of the noise distribution (noise_standard_deviation), the security
level is at least 128 bits according to http://HomomorphicEncryption.org. This makes
it easy for non-expert users to select secure parameters.

</member>
<member name="F:seal.util.global_variables.default_coeff_modulus_192" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\util\globals.h" line="33">
This data structure is a key-value storage that maps degrees of the polynomial modulus
to vectors of SmallModulus elements so that when used with the default value for the
standard deviation of the noise distribution (noise_standard_deviation), the security
level is at least 192 bits according to http://HomomorphicEncryption.org. This makes
it easy for non-expert users to select secure parameters.

</member>
<member name="F:seal.util.global_variables.default_coeff_modulus_256" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\util\globals.h" line="42">
This data structure is a key-value storage that maps degrees of the polynomial modulus
to vectors of SmallModulus elements so that when used with the default value for the
standard deviation of the noise distribution (noise_standard_deviation), the security
level is at least 256 bits according to http://HomomorphicEncryption.org. This makes
it easy for non-expert users to select secure parameters.

</member>
<member name="F:seal.util.global_variables.small_mods_60bit" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\util\globals.h" line="51">
            In SEAL the encryption parameter coeff_modulus is a vector of prime numbers
            represented by instances of the SmallModulus class. We present here vectors
            of pre-selected primes that the user can choose from. These are the largest
            60-bit, 50-bit, 40-bit, 30-bit primes that are congruent to 1 modulo 2^18. The
            primes presented here work for poly_modulus up to degree 131072.

            The user can also use their own primes. The only restriction is that they
            must be at most 60 bits in length, and need to be congruent to 1 modulo
            2 * degree(poly_modulus).

</member>
<member name="T:seal.MemoryPoolHandle" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\memorypoolhandle.h" line="11">
    Manages a shared pointer to a memory pool. SEAL uses memory pools for 
    improved performance due to the large number of memory allocations needed
    by the homomorphic encryption operations, and the underlying polynomial 
    arithmetic. The library automatically creates a shared global memory pool
    that is used for all dynamic allocations by default, and the user can
    optionally create any number of custom memory pools to be used instead.
    
    @Uses in Multi-Threaded Applications
    Sometimes the user might want to use specific memory pools for dynamic
    allocations in certain functions. For example, in heavily multi-threaded
    applications allocating concurrently from a shared memory pool might lead 
    to significant performance issues due to thread contention. For these cases
    SEAL provides overloads of the functions that take a MemoryPoolHandle as an
    additional argument, and uses the associated memory pool for all dynamic
    allocations inside the function. Whenever this functions is called, the 
    user can then simply pass a thread-local MemoryPoolHandle to be used.
    
    @Thread-Unsafe Memory Pools
    While memory pools are by default thread-safe, in some cases it suffices
    to have a memory pool be thread-unsafe. To get a little extra performance,
    the user can optionally create such thread-unsafe memory pools and use them
    just as they would use thread-safe memory pools.

    @Initialized and Uninitialized Handles
    A MemoryPoolHandle has to be set to point either to the global memory pool,
    or to a new memory pool. If this is not done, the MemoryPoolHandle is
    said to be uninitialized, and cannot be used. Initialization simple means
    assigning MemoryPoolHandle::Global() or MemoryPoolHandle::New() to it.

    @Managing Lifetime
    Internally, the MemoryPoolHandle wraps an std::shared_ptr pointing to
    a SEAL memory pool class. Thus, as long as a MemoryPoolHandle pointing to
    a particular memory pool exists, the pool stays alive. Classes such as
    Evaluator and Ciphertext store their own local copies of a MemoryPoolHandle
    to guarantee that the pool stays alive as long as the managing object 
    itself stays alive. The global memory pool is implemented as a global
    std::shared_ptr to a memory pool class, and is thus expected to stay
    alive for the entire duration of the program execution. Note that it can
    be problematic to create other global objects that use the memory pool
    e.g. in their constructor, as one would have to ensure the initialization
    order of these global variables to be correct (i.e. global memory pool
    first).

</member>
<member name="M:seal.MemoryPoolHandle.#ctor(seal.MemoryPoolHandle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\memorypoolhandle.h" line="58">
Creates a new uninitialized MemoryPoolHandle.

        Creates a copy of a given MemoryPoolHandle. As a result, the created
        MemoryPoolHandle will point to the same underlying memory pool as the copied
        instance.

        @param[in] copy The MemoryPoolHandle to copy from

</member>
<member name="M:seal.MemoryPoolHandle.#ctor(seal.MemoryPoolHandle*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\memorypoolhandle.h" line="75">
        Creates a new MemoryPoolHandle by moving a given one. As a result, the moved
        MemoryPoolHandle will become uninitialized.

        @param[in] source The MemoryPoolHandle to move from

</member>
<member name="M:seal.MemoryPoolHandle.op_Assign(seal.MemoryPoolHandle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\memorypoolhandle.h" line="86">
        Overwrites the MemoryPoolHandle instance with the specified instance. As a result, 
        the current MemoryPoolHandle will point to the same underlying memory pool as 
        the assigned instance.

        @param[in] assign The MemoryPoolHandle instance to assign to the current instance

</member>
<member name="M:seal.MemoryPoolHandle.op_Assign(seal.MemoryPoolHandle*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\memorypoolhandle.h" line="99">
        Moves a specified MemoryPoolHandle instance to the current instance. As a result,
        the assigned MemoryPoolHandle will become uninitialized.

        @param[in] assign The MemoryPoolHandle instance to assign to the current instance

</member>
<member name="M:seal.MemoryPoolHandle.Global" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\memorypoolhandle.h" line="111">
Returns a MemoryPoolHandle pointing to the global memory pool.

</member>
<member name="M:seal.MemoryPoolHandle.New" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\memorypoolhandle.h" line="139">
Returns a MemoryPoolHandle pointing to a new thread-safe memory pool.

</member>
<member name="M:seal.MemoryPoolHandle.op_Implicit~seal.util.MemoryPool*!System.Runtime.CompilerServices.IsImplicitlyDereferenced" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\memorypoolhandle.h" line="147">
        Returns a reference to the internal SEAL memory pool that the MemoryPoolHandle
        points to. This function is mainly for internal use.

        @throws std::logic_error if the MemoryPoolHandle is uninitialized

</member>
<member name="M:seal.MemoryPoolHandle.pool_count" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\memorypoolhandle.h" line="164">
        Returns the number of different allocation sizes. This function returns the 
        number of different allocation sizes the memory pool pointed to by the current
        MemoryPoolHandle has made. For example, if the memory pool has only allocated 
        two allocations of sizes 128 KB, this function returns 1. If it has instead
        allocated one allocation of size 64 KB and one of 128 KB, this functions
        returns 2.

        @throws std::logic_error if the MemoryPoolHandle is uninitialized

</member>
<member name="M:seal.MemoryPoolHandle.alloc_uint64_count" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\memorypoolhandle.h" line="183">
Returns the size of allocated memory. This functions returns the total amount
of memory (in 64-bit words) allocated by the memory pool pointed to by the 
current MemoryPoolHandle.

@throws std::logic_error if the MemoryPoolHandle is uninitialized

</member>
<member name="M:seal.MemoryPoolHandle.alloc_byte_count" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\memorypoolhandle.h" line="199">
        Returns the size of allocated memory. This functions returns the total amount
        of memory (in bytes) allocated by the memory pool pointed to by the current 
        MemoryPoolHandle.

        @throws std::logic_error if the MemoryPoolHandle is uninitialized

</member>
<member name="M:seal.MemoryPoolHandle.op_Implicit~System.Boolean" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\memorypoolhandle.h" line="215">
Returns whether the MemoryPoolHandle is initialized.

</member>
<member name="M:seal.MemoryPoolHandle.op_Equality(seal.MemoryPoolHandle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\memorypoolhandle.h" line="223">
Compares MemoryPoolHandles. This function returns whether the current
MemoryPoolHandle points to the same memory pool as a given MemoryPoolHandle.

</member>
<member name="M:seal.MemoryPoolHandle.op_Inequality(seal.MemoryPoolHandle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\memorypoolhandle.h" line="232">
Compares MemoryPoolHandles. This function returns whether the current
MemoryPoolHandle points to a different memory pool than a given 
MemoryPoolHandle.

</member>
<member name="T:seal.BigUInt" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="15">
    Represents an unsigned integer with a specified bit width. Non-const 
    BigUInts are mutable and able to be resized. The bit count for a BigUInt 
    (which can be read with bit_count()) is set initially by the constructor 
    and can be resized either explicitly with the resize() function or 
    implicitly with an assignment operation (e.g., operator=(), operator+=(), 
    etc.). A rich set of unsigned integer operations are provided by the 
    BigUInt class, including comparison, traditional arithmetic (addition, 
    subtraction, multiplication, division), and modular arithmetic functions.

    @par Backing Array
    The backing array for a BigUInt stores its unsigned integer value as 
    a contiguous std::uint64_t array. Each std::uint64_t in the array 
    sequentially represents 64-bits of the integer value, with the least 
    significant quad-word storing the lower 64-bits and the order of the bits 
    for each quad word dependent on the architecture's std::uint64_t 
    representation. The size of the array equals the bit count of the BigUInt 
    (which can be read with bit_count()) rounded up to the next std::uint64_t 
    boundary (i.e., rounded up to the next 64-bit boundary). The uint64_count() 
    function returns the number of std::uint64_t in the backing array. The 
    data() function returns a pointer to the first std::uint64_t in the array. 
    Additionally, the operator [] function allows accessing the individual 
    bytes of the integer value in a platform-independent way - for example, 
    reading the third byte will always return bits 16-24 of the BigUInt value 
    regardless of the platform being little-endian or big-endian.

    @par Implicit Resizing
    Both the copy constructor and operator=() allocate more memory for the 
    backing array when needed, i.e. when the source BigUInt has a larger 
    backing array than the destination. Conversely, when the destination 
    backing array is already large enough, the data is only copied and the 
    unnecessary higher order bits are set to zero. When new memory has to be 
    allocated, only the significant bits of the source BigUInt are taken 
    into account. This is is important, because it avoids unnecessary zero 
    bits to be included in the destination, which in some cases could 
    accumulate and result in very large unnecessary allocations. However, 
    sometimes it is necessary to preserve the original size, even if some 
    of the leading bits are zero. For this purpose BigUInt contains functions 
    duplicate_from and duplicate_to, which create an exact copy of the source 
    BigUInt.

    @par Alias BigUInts
    An aliased BigUInt (which can be determined with is_alias()) is a special 
    type of BigUInt that does not manage its underlying std::uint64_t pointer 
    used to store the value. An aliased BigUInt supports most of the same 
    operations as a non-aliased BigUInt, including reading and writing the 
    value, however an aliased BigUInt does not internally allocate or 
    deallocate its backing array and, therefore, does not support resizing. 
    Any attempt, either explicitly or implicitly, to resize the BigUInt will 
    result in an exception being thrown. An aliased BigUInt can be created 
    with the BigUInt(int, std::uint64_t*) constructor or the alias() function. 
    Note that the pointer specified to be aliased must be deallocated 
    externally after the BigUInt is no longer in use. Aliasing is useful in 
    cases where it is desirable to not have each BigUInt manage its own memory 
    allocation and/or to prevent unnecessary copying. For example, BigPoly 
    uses aliased BigUInt's to return BigUInt representations of its 
    coefficients, where the aliasing allows read/writes to the BigUInt to 
    refer directly to the coefficient's corresponding region in the backing 
    array of the BigPoly.

    @par Thread Safety
    In general, reading a BigUInt is thread-safe while mutating is not. 
    Specifically, the backing array may be freed whenever a resize occurs, 
    the BigUInt is destroyed, or alias() is called, which would invalidate 
    the address returned by data() and the byte references returned by 
    operator []. When it is known that a resize will not occur, concurrent 
    reading and mutating will not inherently fail but it is possible for 
    a read to see a partially updated value from a concurrent write. 
    A non-aliased BigUInt allocates its backing array from the global 
    (thread-safe) memory pool. Consequently, creating or resizing a large 
    number of BigUInt can result in a performance loss due to thread 
    contention.

</member>
<member name="M:seal.BigUInt.#ctor(System.Int32)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="91">
Creates an empty BigUInt with zero bit width. No memory is allocated 
by this constructor.

        Creates a zero-initialized BigUInt of the specified bit width.

        @param[in] bit_count The bit width
        @throws std::invalid_argument if bit_count is negative

</member>
<member name="M:seal.BigUInt.#ctor(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="105">
        Creates a BigUInt initialized and minimally sized to fit the unsigned 
        hexadecimal integer specified by the string. The string matches the format 
        returned by to_string() and must consist of only the characters 0-9, A-F, 
        or a-f, most-significant nibble first.

        @param[in] hex_value The hexadecimal integer string specifying the initial 
        value
        @throws std::invalid_argument if hex_value does not adhere to the expected 
        format

</member>
<member name="M:seal.BigUInt.#ctor(System.Int32,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="118">
        Creates a BigUInt of the specified bit width and initializes it with the 
        unsigned hexadecimal integer specified by the string. The string must match 
        the format returned by to_string() and must consist of only the characters 
        0-9, A-F, or a-f, most-significant nibble first.

        @param[in] bit_count The bit width
        @param[in] hex_value The hexadecimal integer string specifying the initial 
        value
        @throws std::invalid_argument if bit_count is negative
        @throws std::invalid_argument if hex_value does not adhere to the expected 
        format

</member>
<member name="M:seal.BigUInt.#ctor(System.Int32,System.UInt64*)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="133">
        Creates an aliased BigUInt with the specified bit width and backing array. 
        An aliased BigUInt does not internally allocate or deallocate the backing 
        array, and instead uses the specified backing array for all read/write 
        operations. Note that resizing is not supported by an aliased BigUInt and 
        any required deallocation of the specified backing array must occur 
        externally after the aliased BigUInt is no longer in use.

        @param[in] bit_count The bit width
        @param[in] value The backing array to use
        @throws std::invalid_argument if bit_count is negative or value is null
        and bit_count is positive

</member>
<member name="M:seal.BigUInt.#ctor(System.Int32,System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="162">
        Creates a BigUInt of the specified bit width and initializes it to the 
        specified unsigned integer value.

        @param[in] bit_count The bit width
        @param[in] value The initial value to set the BigUInt
        @throws std::invalid_argument if bit_count is negative

</member>
<member name="M:seal.BigUInt.#ctor(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="172">
        Creates a deep copy of a BigUInt. The created BigUInt will have the same 
        bit count and value as the original.

        @param[in] copy The BigUInt to copy from

</member>
<member name="M:seal.BigUInt.#ctor(seal.BigUInt*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="180">
        Creates a new BigUInt by moving an old one.

        @param[in] source The BigUInt to move from

</member>
<member name="M:seal.BigUInt.Dispose" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="187">
Destroys the BigUInt and deallocates the backing array if it is not 
an aliased BigUInt.

</member>
<member name="M:seal.BigUInt.is_alias" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="193">
        Returns whether or not the BigUInt is an alias.

        @see BigUInt for a detailed description of aliased BigUInt.

</member>
<member name="M:seal.BigUInt.bit_count" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="203">
        Returns the bit count for the BigUInt.

        @see significant_bit_count() to instead ignore leading zero bits.

</member>
<member name="M:seal.BigUInt.data" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="213">
        Returns a pointer to the backing array storing the BigUInt value. 
        The pointer points to the beginning of the backing array at the 
        least-significant quad word.

        @warning The pointer is valid only until the backing array is freed, 
        which occurs when the BigUInt is resized, destroyed, or the alias() 
        function is called.
        @see uint64_count() to determine the number of std::uint64_t values 
        in the backing array.

</member>
<member name="M:seal.BigUInt.data" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="229">
        Returns a const pointer to the backing array storing the BigUInt value. 
        The pointer points to the beginning of the backing array at the 
        least-significant quad word.

        @warning The pointer is valid only until the backing array is freed, which 
        occurs when the BigUInt is resized, destroyed, or the alias() function is 
        called.
        @see uint64_count() to determine the number of std::uint64_t values in the 
        backing array.

</member>
<member name="M:seal.BigUInt.byte_count" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="273">
        Returns the number of bytes in the backing array used to store the BigUInt 
        value.

        @see BigUInt for a detailed description of the format of the backing array.

</member>
<member name="M:seal.BigUInt.uint64_count" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="284">
        Returns the number of std::uint64_t in the backing array used to store 
        the BigUInt value.

        @see BigUInt for a detailed description of the format of the backing array.

</member>
<member name="M:seal.BigUInt.significant_bit_count" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="295">
        Returns the number of significant bits for the BigUInt.

        @see bit_count() to instead return the bit count regardless of leading zero 
        bits.

</member>
<member name="M:seal.BigUInt.to_double" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="311">
Returns the BigUInt value as a double. Note that precision may be lost during 
the conversion.

</member>
<member name="M:seal.BigUInt.to_string" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="328">
Returns the BigUInt value as a hexadecimal string.

</member>
<member name="M:seal.BigUInt.to_dec_string" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="333">
Returns the BigUInt value as a decimal string.

</member>
<member name="M:seal.BigUInt.is_zero" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="338">
Returns whether or not the BigUInt has the value zero.

</member>
<member name="M:seal.BigUInt.op_Subscript(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="351">
        Returns the byte at the corresponding byte index of the BigUInt's integer 
        value. The bytes of the BigUInt are indexed least-significant byte first.

        @param[in] index The index of the byte to read
        @throws std::out_of_range if index is not within [0, byte_count())
        @see BigUInt for a detailed description of the format of the backing array.

</member>
<member name="M:seal.BigUInt.op_Subscript(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="369">
        Returns an byte reference that can read/write the byte at the corresponding 
        byte index of the BigUInt's integer value. The bytes of the BigUInt are 
        indexed least-significant byte first.

        @warning The returned byte is an reference backed by the BigUInt's backing 
        array. As such, it is only valid until the BigUInt is resized, destroyed, 
        or alias() is called.

        @param[in] index The index of the byte to read
        @throws std::out_of_range if index is not within [0, byte_count())
        @see BigUInt for a detailed description of the format of the backing array.

</member>
<member name="M:seal.BigUInt.set_zero" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="392">
Sets the BigUInt value to zero. This does not resize the BigUInt.

</member>
<member name="M:seal.BigUInt.resize(System.Int32)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="404">
        Resizes the BigUInt to the specified bit width, copying over the old value 
        as much as will fit.

        @param[in] bit_count The bit width
        @throws std::invalid_argument if bit_count is negative
        @throws std::logic_error if the BigUInt is an alias

</member>
<member name="M:seal.BigUInt.alias(System.Int32,System.UInt64*)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="414">
        Makes the BigUInt an aliased BigUInt with the specified bit width and 
        backing array. An aliased BigUInt does not internally allocate or 
        deallocate the backing array, and instead uses the specified backing array 
        for all read/write operations. Note that resizing is not supported by 
        an aliased BigUInt and any required deallocation of the specified backing 
        array must occur externally after the aliased BigUInt is no longer in use.

        @param[in] bit_count The bit width
        @param[in] value The backing array to use
        @throws std::invalid_argument if bit_count is negative or value is null

</member>
<member name="M:seal.BigUInt.unalias" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="472">
        Resets an aliased BigUInt into an empty non-alias BigUInt with bit count 
        of zero.

        @throws std::logic_error if BigUInt is not an alias

</member>
<member name="M:seal.BigUInt.op_Assign(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="489">
        Overwrites the BigUInt with the value of the specified BigUInt, enlarging 
        if needed to fit the assigned value. Only significant bits are used to 
        size the BigUInt.

        @param[in] assign The BigUInt whose value should be assigned to the 
        current BigUInt
        @throws std::logic_error if BigUInt is an alias and the assigned BigUInt is 
        too large to fit the current bit width

</member>
<member name="M:seal.BigUInt.op_Assign(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="501">
        Overwrites the BigUInt with the unsigned hexadecimal value specified by 
        the string, enlarging if needed to fit the assigned value. The string must 
        match the format returned by to_string() and must consist of only the 
        characters 0-9, A-F, or a-f, most-significant nibble first.

        @param[in] hex_value The hexadecimal integer string specifying the value 
        to assign
        @throws std::invalid_argument if hex_value does not adhere to the 
        expected format
        @throws std::logic_error if BigUInt is an alias and the assigned value 
        is too large to fit the current bit width

</member>
<member name="M:seal.BigUInt.op_Assign(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="516">
        Overwrites the BigUInt with the specified integer value, enlarging if 
        needed to fit the value.

        @param[in] value The value to assign
        @throws std::logic_error if BigUInt is an alias and the significant bit 
        count of value is too large to fit the
        current bit width

</member>
<member name="M:seal.BigUInt.op_UnaryPlus" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="541">
Returns a copy of the BigUInt value resized to the significant bit count.

</member>
<member name="M:seal.BigUInt.op_UnaryNegation" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="551">
Returns a negated copy of the BigUInt value. The bit count does not change.

</member>
<member name="M:seal.BigUInt.op_OnesComplement" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="562">
Returns an inverted copy of the BigUInt value. The bit count does not change.

</member>
<member name="M:seal.BigUInt.op_Increment" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="573">
        Increments the BigUInt and returns the incremented value. The BigUInt will 
        increment the bit count if needed to fit the carry.

        @throws std::logic_error if BigUInt is an alias and a carry occurs requiring 
        the BigUInt to be resized

</member>
<member name="M:seal.BigUInt.op_Decrement" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="592">
Decrements the BigUInt and returns the decremented value. The bit count 
does not change.

</member>
<member name="M:seal.BigUInt.op_Increment(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="603">
Increments the BigUInt but returns its old value. The BigUInt will increment 
the bit count if needed to fit the carry.

</member>
<member name="M:seal.BigUInt.op_Decrement(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="621">
Decrements the BigUInt but returns its old value. The bit count does not change.

</member>
<member name="M:seal.BigUInt.op_Addition(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="633">
        Adds two BigUInts and returns the sum. The input operands are not modified. 
        The bit count of the sum is set to be one greater than the significant bit 
        count of the larger of the two input operands.

        @param[in] operand2 The second operand to add

</member>
<member name="M:seal.BigUInt.op_Addition(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="650">
        Adds a BigUInt and an unsigned integer and returns the sum. The input 
        operands are not modified. The bit count of the sum is set to be one greater 
        than the significant bit count of the larger of the two operands.

        @param[in] operand2 The second operand to add

</member>
<member name="M:seal.BigUInt.op_Subtraction(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="664">
        Subtracts two BigUInts and returns the difference. The input operands are 
        not modified. The bit count of the difference is set to be the significant 
        bit count of the larger of the two input operands.

        @param[in] operand2 The second operand to subtract

</member>
<member name="M:seal.BigUInt.op_Subtraction(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="681">
        Subtracts a BigUInt and an unsigned integer and returns the difference. 
        The input operands are not modified. The bit count of the difference is set 
        to be the significant bit count of the larger of the two operands.

        @param[in] operand2 The second operand to subtract

</member>
<member name="M:seal.BigUInt.op_Multiply(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="695">
        Multiplies two BigUInts and returns the product. The input operands are 
        not modified. The bit count of the product is set to be the sum of the 
        significant bit counts of the two input operands.

        @param[in] operand2 The second operand to multiply

</member>
<member name="M:seal.BigUInt.op_Multiply(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="711">
        Multiplies a BigUInt and an unsigned integer and returns the product. 
        The input operands are not modified. The bit count of the product is set 
        to be the sum of the significant bit counts of the two input operands.

        @param[in] operand2 The second operand to multiply

</member>
<member name="M:seal.BigUInt.op_Division(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="725">
        Divides two BigUInts and returns the quotient. The input operands are 
        not modified. The bit count of the quotient is set to be the significant 
        bit count of the first input operand.

        @param[in] operand2 The second operand to divide
        @throws std::invalid_argument if operand2 is zero

</member>
<member name="M:seal.BigUInt.op_Division(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="735">
        Divides a BigUInt and an unsigned integer and returns the quotient. The 
        input operands are not modified. The bit count of the quotient is set 
        to be the significant bit count of the first input operand.

        @param[in] operand2 The second operand to divide
        @throws std::invalid_argument if operand2 is zero

</member>
<member name="M:seal.BigUInt.op_Modulus(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="750">
        Divides two BigUInts and returns the remainder. The input operands are 
        not modified. The bit count of the remainder is set to be the significant 
        bit count of the first input operand.

        @param[in] operand2 The second operand to divide
        @throws std::invalid_argument iff operand2 is zero

</member>
<member name="M:seal.BigUInt.op_Modulus(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="773">
        Divides a BigUInt and an unsigned integer and returns the remainder. 
        The input operands are not modified. The bit count of the remainder is 
        set to be the significant bit count of the first input operand.

        @param[in] operand2 The second operand to divide
        @throws std::invalid_argument if operand2 is zero

</member>
<member name="M:seal.BigUInt.op_ExclusiveOr(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="788">
        Performs a bit-wise XOR operation between two BigUInts and returns the 
        result. The input operands are not modified. The bit count of the result 
        is set to the maximum of the two input operand bit counts.

        @param[in] operand2 The second operand to XOR

</member>
<member name="M:seal.BigUInt.op_ExclusiveOr(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="817">
        Performs a bit-wise XOR operation between a BigUInt and an unsigned 
        integer and returns the result. The input operands are not modified. 
        The bit count of the result is set to the maximum of the two input 
        operand bit counts.

        @param[in] operand2 The second operand to XOR

</member>
<member name="M:seal.BigUInt.op_BitwiseAnd(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="832">
        Performs a bit-wise AND operation between two BigUInts and returns the 
        result. The input operands are not modified. The bit count of the result 
        is set to the maximum of the two input operand bit counts.

        @param[in] operand2 The second operand to AND

</member>
<member name="M:seal.BigUInt.op_BitwiseAnd(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="861">
        Performs a bit-wise AND operation between a BigUInt and an unsigned 
        integer and returns the result. The input operands are not modified. 
        The bit count of the result is set to the maximum of the two input 
        operand bit counts.

        @param[in] operand2 The second operand to AND

</member>
<member name="M:seal.BigUInt.op_BitwiseOr(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="876">
        Performs a bit-wise OR operation between two BigUInts and returns the 
        result. The input operands are not modified. The bit count of the result 
        is set to the maximum of the two input operand bit counts.

        @param[in] operand2 The second operand to OR

</member>
<member name="M:seal.BigUInt.op_BitwiseOr(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="905">
        Performs a bit-wise OR operation between a BigUInt and an unsigned 
        integer and returns the result. The input operands are not modified. 
        The bit count of the result is set to the maximum of the two input 
        operand bit counts.

        @param[in] operand2 The second operand to OR

</member>
<member name="M:seal.BigUInt.compareto(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="920">
        Compares two BigUInts and returns -1, 0, or 1 if the BigUInt is 
        less-than, equal-to, or greater-than the second operand respectively. 
        The input operands are not modified.

        @param[in] compare The value to compare against

</member>
<member name="M:seal.BigUInt.compareto(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="937">
        Compares a BigUInt and an unsigned integer and returns -1, 0, or 1 if 
        the BigUInt is less-than, equal-to, or greater-than the second operand 
        respectively. The input operands are not modified.

        @param[in] compare The value to compare against

</member>
<member name="M:seal.BigUInt.op_LessThan(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="951">
        Returns whether or not a BigUInt is less-than a second BigUInt. The 
        input operands are not modified.

        @param[in] operand2 The value to compare against

</member>
<member name="M:seal.BigUInt.op_LessThan(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="967">
        Returns whether or not a BigUInt is less-than an unsigned integer. 
        The input operands are not modified.

        @param[in] operand2 The value to compare against

</member>
<member name="M:seal.BigUInt.op_GreaterThan(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="980">
        Returns whether or not a BigUInt is greater-than a second BigUInt. 
        The input operands are not modified.

        @param[in] operand2 The value to compare against

</member>
<member name="M:seal.BigUInt.op_GreaterThan(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="996">
        Returns whether or not a BigUInt is greater-than an unsigned integer. 
        The input operands are not modified.

        @param[in] operand2 The value to compare against

</member>
<member name="M:seal.BigUInt.op_LessThanOrEqual(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1009">
        Returns whether or not a BigUInt is less-than or equal to a second 
        BigUInt. The input operands are not modified.

        @param[in] operand2 The value to compare against

</member>
<member name="M:seal.BigUInt.op_LessThanOrEqual(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1025">
        Returns whether or not a BigUInt is less-than or equal to an unsigned 
        integer. The input operands are not modified.

        @param[in] operand2 The value to compare against

</member>
<member name="M:seal.BigUInt.op_GreaterThanOrEqual(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1038">
        Returns whether or not a BigUInt is greater-than or equal to a second 
        BigUInt. The input operands are not modified.

        @param[in] operand2 The value to compare against

</member>
<member name="M:seal.BigUInt.op_GreaterThanOrEqual(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1054">
        Returns whether or not a BigUInt is greater-than or equal to an unsigned 
        integer. The input operands are not modified.

        @param[in] operand2 The value to compare against

</member>
<member name="M:seal.BigUInt.op_Equality(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1067">
        Returns whether or not a BigUInt is equal to a second BigUInt. 
        The input operands are not modified.

        @param[in] compare The value to compare against

</member>
<member name="M:seal.BigUInt.op_Equality(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1083">
        Returns whether or not a BigUInt is equal to an unsigned integer. 
        The input operands are not modified.

        @param[in] compare The value to compare against

</member>
<member name="M:seal.BigUInt.op_Inequality(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1096">
        Returns whether or not a BigUInt is not equal to a second BigUInt. 
        The input operands are not modified.

        @param[in] compare The value to compare against

</member>
<member name="M:seal.BigUInt.op_Inequality(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1107">
        Returns whether or not a BigUInt is not equal to an unsigned integer. 
        The input operands are not modified.

        @param[in] operand2 The value to compare against

</member>
<member name="M:seal.BigUInt.op_LeftShift(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1120">
        Returns a left-shifted copy of the BigUInt. The bit count of the 
        returned value is the sum of the original significant bit count and 
        the shift amount.

        @param[in] shift The number of bits to shift by
        @throws std::invalid_argument if shift is negative

</member>
<member name="M:seal.BigUInt.op_RightShift(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1142">
        Returns a right-shifted copy of the BigUInt. The bit count of the 
        returned value is the original significant bit count subtracted by 
        the shift amount (clipped to zero if negative).

        @param[in] shift The number of bits to shift by
        @throws std::invalid_argument if shift is negative

</member>
<member name="M:seal.BigUInt.op_AdditionAssignment(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1169">
        Adds two BigUInts saving the sum to the first operand, returning 
        a reference of the first operand. The second input operand is not 
        modified. The first operand is resized if and only if its bit count 
        is smaller than one greater than the significant bit count of the 
        larger of the two input operands.

        @param[in] operand2 The second operand to add
        @throws std::logic_error if the BigUInt is an alias and the operator 
        attempts to enlarge the BigUInt to fit the result

</member>
<member name="M:seal.BigUInt.op_AdditionAssignment(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1193">
        Adds a BigUInt and an unsigned integer saving the sum to the first operand, 
        returning a reference of the first operand. The second input operand is not 
        modified. The first operand is resized if and only if its bit count is 
        smaller than one greater than the significant bit count of the larger of 
        the two input operands.

        @param[in] operand2 The second operand to add
        @throws std::logic_error if the BigUInt is an alias and the operator 
        attempts to enlarge the BigUInt to fit the result

</member>
<member name="M:seal.BigUInt.op_SubtractionAssignment(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1211">
        Subtracts two BigUInts saving the difference to the first operand, 
        returning a reference of the first operand. The second input operand is 
        not modified. The first operand is resized if and only if its bit count 
        is smaller than the significant bit count of the second operand.

        @param[in] operand2 The second operand to subtract
        @throws std::logic_error if the BigUInt is an alias and the operator 
        attempts to enlarge the BigUInt to fit the result

</member>
<member name="M:seal.BigUInt.op_SubtractionAssignment(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1234">
        Subtracts a BigUInt and an unsigned integer saving the difference to 
        the first operand, returning a reference of the first operand. The second 
        input operand is not modified. The first operand is resized if and only 
        if its bit count is smaller than the significant bit count of the second 
        operand.

        @param[in] operand2 The second operand to subtract
        @throws std::logic_error if the BigUInt is an alias and the operator 
        attempts to enlarge the BigUInt to fit the result

</member>
<member name="M:seal.BigUInt.op_MultiplicationAssignment(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1252">
        Multiplies two BigUInts saving the product to the first operand, 
        returning a reference of the first operand. The second input operand 
        is not modified. The first operand is resized if and only if its bit 
        count is smaller than the sum of the significant bit counts of the two 
        input operands.

        @param[in] operand2 The second operand to multiply
        @throws std::logic_error if the BigUInt is an alias and the operator 
        attempts to enlarge the BigUInt to fit the result

</member>
<member name="M:seal.BigUInt.op_MultiplicationAssignment(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1269">
        Multiplies a BigUInt and an unsigned integer saving the product to 
        the first operand, returning a reference of the first operand. The 
        second input operand is not modified. The first operand is resized if
        and only if its bit count is smaller than the sum of the significant 
        bit counts of the two input operands.

        @param[in] operand2 The second operand to multiply
        @throws std::logic_error if the BigUInt is an alias and the operator 
        attempts to enlarge the BigUInt to fit the result

</member>
<member name="M:seal.BigUInt.op_DivisionAssignment(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1287">
        Divides two BigUInts saving the quotient to the first operand, 
        returning a reference of the first operand. The second input operand 
        is not modified. The first operand is never resized.

        @param[in] operand2 The second operand to divide
        @throws std::invalid_argument if operand2 is zero

</member>
<member name="M:seal.BigUInt.op_DivisionAssignment(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1301">
        Divides a BigUInt and an unsigned integer saving the quotient to 
        the first operand, returning a reference of the first operand. The 
        second input operand is not modified. The first operand is never resized.

        @param[in] operand2 The second operand to divide
        @throws std::invalid_argument if operand2 is zero

</member>
<member name="M:seal.BigUInt.op_ModulusAssignment(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1316">
        Divides two BigUInts saving the remainder to the first operand, 
        returning a reference of the first operand. The second input operand 
        is not modified. The first operand is never resized.

        @param[in] operand2 The second operand to divide
        @throws std::invalid_argument if operand2 is zero

</member>
<member name="M:seal.BigUInt.op_ModulusAssignment(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1335">
        Divides a BigUInt and an unsigned integer saving the remainder to 
        the first operand, returning a reference of the first operand. The 
        second input operand is not modified. The first operand is never resized.

        @param[in] operand2 The second operand to divide
        @throws std::Invalid_argument if operand2 is zero

</member>
<member name="M:seal.BigUInt.op_ExclusiveOrAssignment(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1350">
        Performs a bit-wise XOR operation between two BigUInts saving the result 
        to the first operand, returning a reference of the first operand. The 
        second input operand is not modified. The first operand is resized if 
        and only if its bit count is smaller than the significant bit count of 
        the second operand.

        @param[in] operand2 The second operand to XOR
        @throws std::logic_error if the BigUInt is an alias and the operator 
        attempts to enlarge the BigUInt to fit the result

</member>
<member name="M:seal.BigUInt.op_ExclusiveOrAssignment(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1373">
        Performs a bit-wise XOR operation between a BigUInt and an unsigned integer 
        saving the result to the first operand, returning a reference of the first 
        operand. The second input operand is not modified. The first operand is 
        resized if and only if its bit count is smaller than the significant bit 
        count of the second operand.

        @param[in] operand2 The second operand to XOR
        @throws std::logic_error if the BigUInt is an alias and the operator 
        attempts to enlarge the BigUInt to fit the result

</member>
<member name="M:seal.BigUInt.op_BitwiseAndAssignment(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1391">
        Performs a bit-wise AND operation between two BigUInts saving the result 
        to the first operand, returning a reference of the first operand. The 
        second input operand is not modified. The first operand is resized if 
        and only if its bit count is smaller than the significant bit count of 
        the second operand.

        @param[in] operand2 The second operand to AND
        @throws std::logic_error if the BigUInt is an alias and the operator 
        attempts to enlarge the BigUInt to fit the result

</member>
<member name="M:seal.BigUInt.op_BitwiseAndAssignment(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1414">
        Performs a bit-wise AND operation between a BigUInt and an unsigned integer 
        saving the result to the first operand, returning a reference of the first 
        operand. The second input operand is not modified. The first operand is 
        resized if and only if its bit count is smaller than the significant bit 
        count of the second operand.

        @param[in] operand2 The second operand to AND
        @throws std::logic_error if the BigUInt is an alias and the operator 
        attempts to enlarge the BigUInt to fit the result

</member>
<member name="M:seal.BigUInt.op_BitwiseOrAssignment(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1432">
        Performs a bit-wise OR operation between two BigUInts saving the result to 
        the first operand, returning a reference of the first operand. The second 
        input operand is not modified. The first operand is resized if and only if 
        its bit count is smaller than the significant bit count of the second 
        operand.

        @param[in] operand2 The second operand to OR
        @throws std::logic_error if the BigUInt is an alias and the operator 
        attempts to enlarge the BigUInt to fit the result

</member>
<member name="M:seal.BigUInt.op_BitwiseOrAssignment(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1455">
        Performs a bit-wise OR operation between a BigUInt and an unsigned integer 
        saving the result to the first operand, returning a reference of the first 
        operand. The second input operand is not modified. The first operand is 
        resized if and only if its bit count is smaller than the significant bit 
        count of the second operand.

        @param[in] operand2 The second operand to OR
        @throws std::logic_error if the BigUInt is an alias and the operator 
        attempts to enlarge the BigUInt to fit the result

</member>
<member name="M:seal.BigUInt.op_LeftShiftAssignment(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1473">
        Left-shifts a BigUInt by the specified amount. The BigUInt is resized if 
        and only if its bit count is smaller than the sum of its significant bit 
        count and the shift amount.

        @param[in] shift The number of bits to shift by
        @throws std::Invalid_argument if shift is negative
        @throws std::logic_error if the BigUInt is an alias and the operator 
        attempts to enlarge the BigUInt to fit the result

</member>
<member name="M:seal.BigUInt.op_RightShiftAssignment(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1498">
        Right-shifts a BigUInt by the specified amount. The BigUInt is never 
        resized.

        @param[in] shift The number of bits to shift by
        @throws std::Invalid_argument if shift is negative

</member>
<member name="M:seal.BigUInt.divrem(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,seal.BigUInt*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1520">
        Divides two BigUInts and returns the quotient and sets the remainder 
        parameter to the remainder. The bit count of the quotient is set to be 
        the significant bit count of the BigUInt. The remainder is resized if 
        and only if it is smaller than the bit count of the BigUInt.

        @param[in] operand2 The second operand to divide
        @param[out] remainder The BigUInt to store the remainder
        @throws std::Invalid_argument if operand2 is zero
        @throws std::logic_error if the remainder is an alias and the operator 
        attempts to enlarge the BigUInt to fit the result

</member>
<member name="M:seal.BigUInt.divrem(System.UInt64,seal.BigUInt*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1534">
        Divides a BigUInt and an unsigned integer and returns the quotient and 
        sets the remainder parameter to the remainder. The bit count of the 
        quotient is set to be the significant bit count of the BigUInt. The 
        remainder is resized if and only if it is smaller than the bit count 
        of the BigUInt.

        @param[in] operand2 The second operand to divide
        @param[out] remainder The BigUInt to store the remainder
        @throws std::Invalid_argument if operand2 is zero
        @throws std::logic_error if the remainder is an alias which the 
        function attempts to enlarge to fit the result

</member>
<member name="M:seal.BigUInt.modinv(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1554">
        Returns the inverse of a BigUInt with respect to the specified modulus. 
        The original BigUInt is not modified. The bit count of the inverse is 
        set to be the significant bit count of the modulus.

        @param[in] modulus The modulus to calculate the inverse with respect to
        @throws std::Invalid_argument if modulus is zero
        @throws std::Invalid_argument if modulus is not greater than the BigUInt value
        @throws std::Invalid_argument if the BigUInt value and modulus are not co-prime

</member>
<member name="M:seal.BigUInt.modinv(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1585">
        Returns the inverse of a BigUInt with respect to the specified modulus. 
        The original BigUInt is not modified. The bit count of the inverse is set 
        to be the significant bit count of the modulus.

        @param[in] modulus The modulus to calculate the inverse with respect to
        @throws std::Invalid_argument if modulus is zero
        @throws std::Invalid_argument if modulus is not greater than the BigUInt value
        @throws std::Invalid_argument if the BigUInt value and modulus are not co-prime

</member>
<member name="M:seal.BigUInt.trymodinv(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,seal.BigUInt*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1602">
        Attempts to calculate the inverse of a BigUInt with respect to the 
        specified modulus, returning whether or not the inverse was successful 
        and setting the inverse parameter to the inverse. The original BigUInt 
        is not modified. The inverse parameter is resized if and only if its bit 
        count is smaller than the significant bit count of the modulus.

        @param[in] modulus The modulus to calculate the inverse with respect to
        @param[out] inverse Stores the inverse if the inverse operation was 
        successful
        @throws std::Invalid_argument if modulus is zero
        @throws std::Invalid_argument if modulus is not greater than the BigUInt 
        value
        @throws std::logic_error if the inverse is an alias which the function 
        attempts to enlarge to fit the result

</member>
<member name="M:seal.BigUInt.trymodinv(System.UInt64,seal.BigUInt*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1638">
        Attempts to calculate the inverse of a BigUInt with respect to the 
        specified modulus, returning whether or not the inverse was successful 
        and setting the inverse parameter to the inverse. The original BigUInt 
        is not modified. The inverse parameter is resized if and only if its 
        bit count is smaller than the significant bit count of the modulus.

        @param[in] modulus The modulus to calculate the inverse with respect to
        @param[out] inverse Stores the inverse if the inverse operation was 
        successful
        @throws std::Invalid_argument if modulus is zero
        @throws std::Invalid_argument if modulus is not greater than the BigUInt 
        value
        @throws std::logic_error if the inverse is an alias which the function 
        attempts to enlarge to fit the result

</member>
<member name="M:seal.BigUInt.save(std.basic_ostream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1661">
        Saves the BigUInt to an output stream. The full state of the BigUInt is 
        serialized, including insignificant bits. The output is in binary format 
        and not human-readable. The output stream must have the "binary" flag set.

        @param[in] stream The stream to save the BigUInt to
        @see load() to load a saved BigUInt.

</member>
<member name="M:seal.BigUInt.load(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1671">
        Loads a BigUInt from an input stream overwriting the current BigUInt 
        and enlarging if needed to fit the loaded BigUInt.

        @param[in] stream The stream to load the BigUInt from
        @throws std::logic_error if BigUInt is an alias and the loaded BigUInt 
        is too large to fit with the current bit width
        @see save() to save a BigUInt.

</member>
<member name="M:seal.BigUInt.of(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1682">
Creates a minimally sized BigUInt initialized to the specified unsigned 
integer value.

@param[in] value The value to initialized the BigUInt to

</member>
<member name="M:seal.BigUInt.duplicate_to(seal.BigUInt*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1695">
        Duplicates the current BigUInt. The bit count and the value of the 
        given BigUInt are set to be exactly the same as in the current one.

        @param[out] destination The BigUInt to overwrite with the duplicate
        @throws std::logic_error if the destination BigPoly is an alias

</member>
<member name="M:seal.BigUInt.duplicate_from(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1708">
        Duplicates a given BigUInt. The bit count and the value of the current 
        BigUInt are set to be exactly the same as in the given one.

        @param[in] value The BigUInt to duplicate
        @throws std::logic_error if the current BigPoly is an alias

</member>
<member name="M:seal.BigUInt.reset" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1724">
Resets the entire state of the BigUInt to an empty, zero-sized state, 
freeing any memory it internally allocated. If the BigUInt was an alias, 
the backing array is not freed but the alias is no longer referenced.

</member>
<member name="F:seal.BigUInt.value_" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1735">
        Points to the backing array for the BigUInt. This pointer will be set 
        to nullptr if and only if the bit count is zero. This pointer is 
        automatically allocated and freed by the BigUInt if and only if 
        the BigUInt is not an alias. If the BigUInt is an alias, then the 
        pointer was passed-in to a constructor or alias() call, and will not be
        deallocated by the BigUInt.

        @see BigUInt for more information about aliased BigUInts or the format 
        of the backing array.

</member>
<member name="F:seal.BigUInt.bit_count_" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\biguint.h" line="1748">
The bit count for the BigUInt.

</member>
<member name="T:seal.BigPoly" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="16">
    Represents a polynomial consisting of a set of unsigned integer coefficients 
    with a specified bit width. Non-const BigPolys are mutable and able to be resized. 
    Individual coefficients can be read/written through the operator [] function. 
    A BigPoly has a set coefficient count (which can be read with coeff_count()) and 
    coefficient bit width (which can be read with coeff_bit_count()), and all 
    coefficients in a BigPoly have the same bit width. The coefficient count and bit 
    width of a BigPoly is set initially by the constructor, and can be resized either
    explicitly with the resize() function, or implicitly with for example the 
    operator=() function.

    @par Backing Array
    A BigPoly's coefficients are stored sequentially, index-zero coefficient first, 
    in a contiguous std::uint64_t array. The width of each coefficient is rounded up to 
    the next std::uint64_t width (i.e., to the next 64-bit boundary). The coeff_uint64_count() 
    function returns the number of std::uint64_t values used per coefficient. The 
    uint64_count() function returns the number of std::uint64_t values used to store all 
    coefficients. Each coefficient is stored in an identical format to BigUInt, with the 
    least quad word first and the order of bits for each quad word dependent on the 
    architecture's std::uint64_t representation. For each coefficient, the bits higher 
    than the coefficient bit count must be set to zero to prevent undefined behavior. 
    The data(int) function returns a pointer to the first std::uint64_t of a specified 
    coefficient in the array. 

    @par Implicit Resizing
    Both the copy constructor and operator=() allocate more memory for the backing array 
    when needed, i.e. when the source polynomial has a larger backing array than the 
    destination. Conversely, when the destination backing array is already large enough, 
    the data is only copied and the unnecessary higher degree coefficients are set to zero. 
    When new memory has to be allocated, only the significant coefficients of the source 
    polynomial are taken into account. This is is important, because it avoids unnecessary 
    zero coefficients to be included in the destination, which in some cases could 
    accumulate and result in very large unnecessary allocations. However, sometimes it is 
    necessary to preserve the original coefficient count, even if some of the leading 
    coefficients are zero. This comes up for example when copying individual polynomials 
    of ciphertext BigPolyArray objects, as these polynomials need to have the leading 
    coefficient equal to zero to be considered valid by classes such as Evaluator and 
    Decryptor. For this purpose BigPoly contains functions duplicate_from and duplicate_to, 
    which create an exact copy of the source BigPoly.

    @par Alias BigPolys
    An aliased BigPoly (which can be determined with is_alias()) is a special type of 
    BigPoly that does not manage its underlying std::uint64_t pointer that stores the 
    coefficients. An aliased BigPoly supports most of the same operations as a non-aliased 
    BigPoly, including reading/writing the coefficients and assignment, however an aliased 
    BigPoly does not internally allocate or deallocate its backing array and, therefore, 
    does not support resizing. Any attempt, either explicitly or implicitly, to resize the 
    BigPoly will result in an exception being thrown. An aliased BigPoly can be created 
    with the BigPoly(int, int, std::uint64_t*) constructor or the alias() function. Note 
    that the pointer specified to be aliased must be deallocated externally after the 
    BigPoly is no longer in use. Aliasing is useful in cases where it is desirable to not 
    have each BigPoly manage its own memory allocation and/or to prevent unnecessary 
    coefficient copying.

    @par Thread Safety
    In general, reading a BigPoly is thread-safe while mutating is not. Specifically, 
    the backing array may be freed whenever a resize occurs, the BigPoly is destroyed, or 
    alias() is called, which would invalidate the address returned by data(int) and the 
    coefficients returned by operator []. When it is known a resize will not occur, 
    concurrent reading and mutating is safe as long as it is known that concurrent 
    reading and mutating for the same coefficient will not occur, as the reader may see 
    a partially updated coefficient value. A non-aliased BigPoly allocates its backing 
    array from the global (thread-safe) memory pool. Consequently, creating or resizing 
    a large number of BigPolys can result in a performance loss due to thread contention.

    @see BigPolyArith for arithmetic and modular functions on BigPolys.
    @see BigUInt for more details on the coefficients returned by operator []().

</member>
<member name="M:seal.BigPoly.#ctor(System.Int32,System.Int32)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="87">
Creates an empty BigPoly with zero coefficients and zero coefficient bit width. 
No memory is allocated by this constructor.

        Creates a zero-initialized BigPoly of the specified coefficient count and bit width.

        @param[in] coeff_count The number of coefficients
        @param[in] coeff_bit_count The bit width of each coefficient
        @throws std::invalid_argument if either coeff_count or coeff_bit_count is negative

</member>
<!-- Discarding badly formed XML document comment for member 'M:seal.BigPoly.#ctor(std.basic_string<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte>>!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)'. -->
<!-- Discarding badly formed XML document comment for member 'M:seal.BigPoly.#ctor(System.Int32,System.Int32,std.basic_string<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte>>!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)'. -->
<member name="M:seal.BigPoly.#ctor(System.Int32,System.Int32,System.UInt64*)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="153">
        Creates an aliased BigPoly with the specified coefficient count, bit width, 
        and backing array. An aliased BigPoly does not internally allocate or deallocate 
        the backing array, and instead uses the specified backing array for all read/write 
        operations. Note that resizing is not supported by an aliased BigPoly and any 
        required deallocation of the specified backing array must occur externally after 
        the aliased BigPoly is no longer in use.

        @param[in] coeff_count The number of coefficients
        @param[in] coeff_bit_count The bit width of each coefficient
        @param[in] value The backing array to use
        @throws std::invalid_argument if coeff_count or coeff_bit_count is negative or
        value is null and coeff_count and coeff_bit_count are positive 

</member>
<member name="M:seal.BigPoly.#ctor(seal.BigPoly!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="185">
        Creates a deep copy of a BigPoly. The created BigPoly will have the same 
        coefficient count, coefficient bit count, and coefficient values as the original.

        @param[in] copy The BigPoly to copy from

</member>
<member name="M:seal.BigPoly.#ctor(seal.BigPoly*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="193">
        Creates a new BigPoly by moving an old one.

        @param[in] source The BigPoly to move from

</member>
<member name="M:seal.BigPoly.Dispose" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="200">
Destroys the BigPoly and deallocates the backing array if it is not an aliased 
BigPoly.

</member>
<member name="M:seal.BigPoly.is_alias" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="206">
        Returns whether or not the BigPoly is an alias.

        @see BigPoly for a detailed description of aliased BigPolys.

</member>
<member name="M:seal.BigPoly.coeff_count" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="216">
        Returns the coefficient count for the BigPoly.

        @see significant_coeff_count() to instead ignore the leading coefficients that 
        have a value of zero.

</member>
<member name="M:seal.BigPoly.coeff_bit_count" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="227">
        Returns the number of bits per coefficient.

        @see significant_coeff_bit_count() to instead get the number of significant bits 
        of the largest coefficient in the BigPoly.

</member>
<member name="M:seal.BigPoly.data" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="238">
Returns a pointer to the backing array storing all of the coefficient 
values.

</member>
<member name="M:seal.BigPoly.data" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="247">
Returns a constant pointer to the backing array storing all of the 
coefficient values.

</member>
<member name="M:seal.BigPoly.data(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="284">
        Returns a pointer to the backing array storing all of the coefficient values. 
        The pointer points to the beginning of a specified coefficient in the backing array, 
        where all coefficients are stored sequentially. Note that the return value will be 
        nullptr if the coefficient count and/or bit count is zero.

        @param[in] poly_index The index of the polynomial
        @warning The pointer is valid only until the backing array is freed, which occurs 
        when the BigPoly is resized, destroyed, or the alias() function is called.
        @throws std::out_of_range If coeff_index is not within [0, coeff_count())
        @see coeff_uint64_count() to determine the number of std::uint64_t values used for 
        each coefficient in the backing array.

</member>
<member name="M:seal.BigPoly.data(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="310">
        Returns a const pointer to the backing array storing all of the coefficient values. 
        The pointer points to the beginning of a specified coefficient in the backing array, 
        where all coefficients are stored sequentially. Note that the return value will be 
        nullptr if the coefficient count and/or bit count is zero.

        @param[in] poly_index The index of the polynomial
        @warning The pointer is valid only until the backing array is freed, which occurs 
        when the BigPoly is resized, destroyed, or the alias() function is called.
        @throws std::out_of_range If coeff_index is not within [0, coeff_count())
        @see coeff_uint64_count() to determine the number of std::uint64_t values used 
        for each coefficient in the backing array.

</member>
<member name="M:seal.BigPoly.uint64_count" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="328">
        Returns the total number of std::uint64_t in the backing array to store all of 
        the coefficients of the BigPoly.

        @see coeff_uint64_count() to determine the number of std::uint64_t values used 
        for each individual coefficient.
        @see BigPoly for a more detailed description of the format of the backing array.

</member>
<member name="M:seal.BigPoly.coeff_uint64_count" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="341">
        Returns the number of std::uint64_t in the backing array used to store each 
        coefficient.

        @see uint64_count() to determine the total number of std::uint64_t values used 
        to store all of the coefficients.
        @see BigPoly for a more detailed description of the format of the backing array.

</member>
<member name="M:seal.BigPoly.significant_coeff_count" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="354">
        Returns the coefficient count for the BigPoly ignoring all of the highest 
        coefficients that have value zero.

        @see coeff_count() to instead return the coefficient count regardless of 
        the number of leading zero terms.

</member>
<member name="M:seal.BigPoly.significant_coeff_bit_count" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="371">
        Returns the number of significant bits of the largest coefficient in 
        the BigPoly.

        @see coeff_bit_count() to instead return the coefficient bit count 
        regardless of leading zero bits.

</member>
<!-- Discarding badly formed XML document comment for member 'M:seal.BigPoly.to_string'. -->
<member name="M:seal.BigPoly.op_Equality(seal.BigPoly!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="400">
        Returns whether or not the BigPoly has the same value as a specified BigPoly. 
        Value equality is not determined by the raw coefficient count or bit count, 
        but rather if the significant bits of non-zero coefficients have the same value.

        @param[in] compare The BigPoly to compare against

</member>
<member name="M:seal.BigPoly.op_Inequality(seal.BigPoly!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="425">
        Returns whether or not the BigPoly has a different value than a specified 
        BigPoly. Value equality is not determined by the raw coefficient count or 
        bit count, but rather if the significant bits of non-zero coefficients have 
        the same value.

        @param[in] compare The BigPoly to compare against

</member>
<member name="M:seal.BigPoly.is_zero" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="438">
Returns whether or not the BigPoly has all zero coefficients.

</member>
<member name="M:seal.BigPoly.op_Subscript(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="450">
        Returns a BigUInt that can read the coefficient at the specified index. 
        The BigUInt is an aliased BigUInt that points directly to the backing array 
        of the BigPoly.

        @warning The returned BigUInt is an alias backed by a region of 
        the BigPoly's backing array. As such, it is only valid until the BigPoly is 
        resized, destroyed, or alias() is called.

        @param[in] coeff_index The index of the coefficient to read
        @throws std::out_of_range if coeff_index is not within [0, coeff_count())
        @see BigUInt for operations that can be performed on the coefficients.

</member>
<member name="M:seal.BigPoly.op_Subscript(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="472">
        Returns a BigUInt that can read or write the coefficient at the specified 
        index. The BigUInt is an aliased BigUInt that points directly to the backing 
        array of the BigPoly.

        @warning The returned BigUInt is an alias backed by a region of 
        the BigPoly's backing array. As such, it is only valid until the BigPoly is 
        resized, destroyed, or alias() is called.

        @param[in] coeff_index The index of the coefficient to read/write
        @throws std::out_of_range if coeff_index is not within [0, coeff_count())
        @see BigUInt for operations that can be performed on the coefficients.

</member>
<member name="M:seal.BigPoly.set_zero" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="494">
Sets all coefficients to have a value of zero. This does not resize the 
BigPoly.

</member>
<member name="M:seal.BigPoly.set_zero(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="503">
        Sets all coefficients within [start_coeff, coefficient count) to have 
        a value of zero. This does not resize the BigPoly or modify the other 
        coefficients.

        @param[in] start_coeff The index of the first coefficient to set to zero
        @throws out_of_range if start_coeff is not within [0, coeff_count()]

</member>
<member name="M:seal.BigPoly.set_zero(System.Int32,System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="520">
        Sets all coefficients within [start_coeff, start_coeff + length) to have 
        a value of zero. This does not resize the BigPoly or modify the other 
        coefficients.

        @param[in] start_coeff The index of the first coefficient to set to zero
        @param[in] length The number of coefficients to set to zero
        @throws std::out_of_range if start_coeff is not within [0, coeff_count()]
        @throws std::out_of_range if length is negative or start_coeff + length 
        is not within [0, coeff_count()]

</member>
<member name="M:seal.BigPoly.resize(System.Int32,System.Int32)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="550">
        Resizes a BigPoly to the specified coefficient count and bit width, 
        copying over and resizing existing coefficient values as much as will fit. 
        If coefficient count is reduced, the leading coefficients are dropped. If 
        coefficient count increases, the new coefficients are initialized to zero.

        @param[in] coeff_count The number of coefficients
        @param[in] coeff_bit_count The bit width of each coefficient
        @throws std::invalid_argument if either coeff_count or coeff_bit_count is negative
        @throws std::logic_error if the BigPoly is an alias

</member>
<member name="M:seal.BigPoly.alias(System.Int32,System.Int32,System.UInt64*)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="563">
        Makes the BigPoly an aliased BigPoly with the specified coefficient count, 
        bit width, and backing array. An aliased BigPoly does not internally 
        allocate or deallocate the backing array, and instead uses the specified 
        backing array for all read/write operations. Note that resizing is not 
        supported by an aliased BigPoly and any required deallocation of the 
        specified backing array must occur externally after the aliased BigPoly 
        is no longer in use.

        @param[in] coeff_count The number of coefficients
        @param[in] coeff_bit_count The bit width of each coefficient
        @param[in] value The backing array to use
        @throws std::invalid_argument if coeff_count or coeff_bit_count is negative 
        or value is null
        @see BigPoly for a more detailed description of aliased BigPolys.

</member>
<member name="M:seal.BigPoly.unalias" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="581">
        Resets an aliased BigPoly into an empty non-alias BigPoly with coefficient 
        count and bit count of zero.

        @throws std::logic_error if BigPoly is not an alias

</member>
<member name="M:seal.BigPoly.op_Assign(seal.BigPoly!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="598">
        Overwrites the BigPoly with the value of the specified BigPoly, enlarging 
        if needed to fit the assigned value. Only significant coefficients and 
        significant coefficient bit counts are used to size the BigPoly.

        @param[in] assign The BigPoly whose value should be assigned to the current 
        BigPoly
        @throws std::logic_error if BigPoly is an alias and the assigned BigPoly is 
        too large to fit the current coefficient count and/or bit width

</member>
<!-- Discarding badly formed XML document comment for member 'M:seal.BigPoly.op_Assign(std.basic_string<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte>>!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)'. -->
<member name="M:seal.BigPoly.save(std.basic_ostream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="636">
        Saves the BigPoly to an output stream. The full state of the BigPoly is 
        serialized, including leading zero coefficients and insignificant coefficient 
        bits. The output is in binary format and not human-readable. The output stream 
        must have the "binary" flag set.

        @param[in] stream The stream to save the BigPoly to
        @see load() to load a saved BigPoly.

</member>
<member name="M:seal.BigPoly.load(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="647">
        Loads a BigPoly from an input stream overwriting the current BigPoly and 
        enlarging if needed to fit the loaded BigPoly.

        @param[in] stream The stream to load the BigPoly from
        @throws std::logic_error if BigPoly is an alias and the loaded polynomial is 
        too large to fit the current coefficient count and/or bit width
        @see save() to save a BigPoly.

</member>
<member name="M:seal.BigPoly.duplicate_to(seal.BigPoly*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="658">
        Duplicates the current BigPoly. The coefficient count, the coefficient 
        bit count, and the value of the given BigPoly are set to be exactly the same 
        as in the current one.

        @param[out] destination The BigPoly to overwrite with the duplicate
        @throws std::logic_error if the destination BigPoly is an alias

</member>
<member name="M:seal.BigPoly.duplicate_from(seal.BigPoly!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="672">
        Duplicates a given BigPoly. The coefficient count, the coefficient 
        bit count, and the value of the current BigPoly are set to be exactly 
        the same as in the given one.

        @param[in] value The BigPoly to duplicate
        @throws std::logic_error if the current BigPoly is an alias

</member>
<member name="M:seal.BigPoly.reset" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="689">
Resets the entire state of the BigPoly to an empty, zero-sized state, 
freeing any memory it internally allocated. If the BigPoly was an alias, 
the backing array is not freed but the alias is no longer referenced.

</member>
<member name="F:seal.BigPoly.value_" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="704">
        Points to the backing array for the coefficients. This pointer will be set 
        to nullptr if and only if the coefficient count or coefficient bit count is 
        zero. This pointer is automatically allocated and freed by the BigPoly if and
        only if the BigPoly is not an alias. If the BigPoly is an alias, then the 
        pointer was passed-in to a constructor or alias() call, and will not be 
        deallocated by the BigPoly.

        @see BigPoly for more information about aliased BigPolys or the format 
        of the backing array.

</member>
<member name="F:seal.BigPoly.coeffs_" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="717">
Points to an array of BigUInt's for the return value of the operator [] 
function. This array is always allocated and deallocated by the BigPoly 
regardless of whether or not it is an alias. Each BigUInt is itself an alias 
that points to the corresponding coefficient's location in the backing array 
value_. This pointer will be set to nullptr if and only if the coefficient 
count is zero.

</member>
<member name="F:seal.BigPoly.coeff_count_" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="727">
The number of coefficients in the BigPoly.

</member>
<member name="F:seal.BigPoly.coeff_bit_count_" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="732">
        The number of bits per coefficient. Note that storage requirements may be 
        more than the bit count because the space reserved for each coefficient is 
        rounded up to the next std::uint64_t boundary (i.e., the next 64-bit boundary).

        @see BigPoly for more information about the format of the backing array.

</member>
<member name="F:seal.BigPoly.coeff_uint64_count_" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="741">
        The number of std::uint64_t per coefficient. 

        @see BigPoly for more information about the format of the backing array.

</member>
<member name="F:seal.BigPoly.is_alias_" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\bigpoly.h" line="748">
        Specifies whether or not the BigPoly is an alias. An alias BigPoly does not 
        allocate its own backing array and instead uses the pointer of a backing array 
        passed in to the constructor or alias() function.

        @see BigPoly for more information about the format of the backing array.

</member>
<member name="T:seal.UniformRandomGenerator" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\randomgen.h" line="8">
Provides the base-class for a uniform random number generator. Instances of this
class are typically returned from the UniformRandomGeneratorFactory class. This 
class is meant for users to sub-class to implement their own random number 
generators. The implementation should provide a uniform random unsigned 32-bit 
value for each call to generate(). Note that the library will never make 
concurrent calls to generate() to the same instance (but individual instances of 
the same class may have concurrent calls). The uniformity and unpredictability 
of the numbers generated is essential for making a secure cryptographic system.

@see UniformRandomGeneratorFactory for the base-class of a factory class that 
generates UniformRandomGenerator instances.
@see StandardRandomAdapter for an implementation of UniformRandomGenerator to 
support the C++ standard library's random number generators.

</member>
<member name="M:seal.UniformRandomGenerator.generate" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\randomgen.h" line="26">
Generates a new uniform unsigned 32-bit random number. Note that the 
implementation does not need to be thread-safe.

</member>
<member name="M:seal.UniformRandomGenerator.Dispose" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\randomgen.h" line="32">
Destroys the random number generator.

</member>
<member name="T:seal.UniformRandomGeneratorFactory" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\randomgen.h" line="40">
    Provides the base-class for a factory instance that creates instances of
    UniformRandomGenerator. This class is meant for users to sub-class to
    implement their own random number generators. Note that each instance
    returned may be used concurrently across separate threads, but each
    individual instance does not need to be thread-safe.

    @see UniformRandomGenerator for details relating to the random number
    generator instances.
    @see StandardRandomAdapterFactory for an implementation of
    UniformRandomGeneratorFactory that supports the standard C++ library's
    random number generators.

</member>
<member name="M:seal.UniformRandomGeneratorFactory.create" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\randomgen.h" line="56">
Creates a new uniform random number generator. The caller of create needs
to ensure the returned instance is destroyed once it is no longer in-use
to prevent a memory leak.

</member>
<member name="M:seal.UniformRandomGeneratorFactory.Dispose" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\randomgen.h" line="63">
Destroys the random number generator factory.

</member>
<member name="M:seal.UniformRandomGeneratorFactory.default_factory" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\randomgen.h" line="70">
Returns the default random number generator factory. This instance should
not be destroyed.

</member>
<member name="T:seal.SmallModulus" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\smallmodulus.h" line="11">
    Represent an integer modulus of up to 62 bits. An instance of the SmallModulus
    class represents a non-negative integer modulus up to 62 bits. In particular, 
    the encryption parameter plain_modulus, and the primes in coeff_modulus, are
    represented by instances of SmallModulus. The purpose of this class is to 
    perform and store the pre-computation required by Barrett reduction.

    @par Thread Safety
    In general, reading from SmallModulus is thread-safe as long as no other thread 
    is  concurrently mutating it.

    @see EncryptionParameters for a description of the encryption parameters.

</member>
<member name="M:seal.SmallModulus.#ctor(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\smallmodulus.h" line="27">
        Creates a SmallModulus instance. The value of the SmallModulus is set to 
        the given value, or to zero by default.

        @param[in] value The integer modulus
        @throws std::invalid_argument if value is 1 or more than 62 bits

</member>
<member name="M:seal.SmallModulus.op_Assign(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\smallmodulus.h" line="39">
        Creates a new SmallModulus by copying a given one.

        @param[in] copy The SmallModulus to copy from

        Creates a new SmallModulus by copying a given one.

        @param[in] source The SmallModulus to move from

        Copies a given SmallModulus to the current one.

        @param[in] assign The SmallModulus to copy from

        Moves a given SmallModulus to the current one.

        @param[in] assign The SmallModulus to move from

        Sets the value of the SmallModulus.

        @param[in] value The new integer modulus
        @throws std::invalid_argument if value is 1 or more than 62 bits

</member>
<member name="M:seal.SmallModulus.bit_count" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\smallmodulus.h" line="79">
Returns the significant bit count of the value of the current SmallModulus.

</member>
<member name="M:seal.SmallModulus.uint64_count" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\smallmodulus.h" line="87">
Returns the size (in 64-bit words) of the value of the current SmallModulus.

</member>
<member name="M:seal.SmallModulus.data" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\smallmodulus.h" line="95">
Returns a const pointer to the value of the current SmallModulus.

</member>
<member name="M:seal.SmallModulus.value" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\smallmodulus.h" line="103">
Returns the value of the current SmallModulus.

</member>
<member name="M:seal.SmallModulus.const_ratio" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\smallmodulus.h" line="111">
Returns the Barrett ratio computed for the value of the current SmallModulus.
The first two components of the Barrett ratio are the floor of 2^128/value,
and the third component is the remainder.

</member>
<member name="M:seal.SmallModulus.is_zero" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\smallmodulus.h" line="121">
Returns whether the value of the current SmallModulus is zero.

</member>
<member name="M:seal.SmallModulus.op_Equality(seal.SmallModulus!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\smallmodulus.h" line="129">
        Compares two SmallModulus instances.

        @param[in] compare The SmallModulus to compare against

</member>
<member name="M:seal.SmallModulus.op_Inequality(seal.SmallModulus!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\smallmodulus.h" line="139">
        Compares two SmallModulus instances.

        @param[in] compare The SmallModulus to compare against

</member>
<member name="M:seal.SmallModulus.save(std.basic_ostream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\smallmodulus.h" line="149">
        Saves the SmallModulus to an output stream. The full state of the modulus is 
        serialized. The output is in binary format and not human-readable. The output 
        stream must have the "binary" flag set.

        @param[in] stream The stream to save the SmallModulus to

</member>
<member name="M:seal.SmallModulus.load(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\smallmodulus.h" line="158">
        Loads a SmallModulus from an input stream overwriting the current SmallModulus.

        @param[in] stream The stream to load the SmallModulus from

</member>
<member name="T:seal.SmallModulus.SmallModulusPrivateHelper" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\smallmodulus.h" line="165">
Enables access to private members of seal::Ciphertext for .NET wrapper.

</member>
<member name="M:seal.coeff_modulus_128(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\defaultparams.h" line="12">
    Returns the default coefficients modulus for a given polynomial modulus degree.
    The polynomial modulus and the coefficient modulus obtained in this way should
    provide approdimately 128 bits of security against the best known attacks,
    assuming the standard deviation of the noise distribution is left to its default 
    value.

    @param[in] poly_modulus_degree The degree of the polynomial modulus
    @throws std::out_of_range if poly_modulus_degree is not 1024, 2048, 4096, 8192, 16384, or 32768

</member>
<member name="M:seal.coeff_modulus_192(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\defaultparams.h" line="35">
    Returns the default coefficients modulus for a given polynomial modulus degree.
    The polynomial modulus and the coefficient modulus obtained in this way should
    provide approdimately 192 bits of security against the best known attacks,
    assuming the standard deviation of the noise distribution is left to its default
    value.

    @param[in] poly_modulus_degree The degree of the polynomial modulus
    @throws std::out_of_range if poly_modulus_degree is not 1024, 2048, 4096, 8192, 16384, or 32768

</member>
<member name="M:seal.coeff_modulus_256(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\defaultparams.h" line="58">
    Returns the default coefficients modulus for a given polynomial modulus degree.
    The polynomial modulus and the coefficient modulus obtained in this way should
    provide approdimately 256 bits of security against the best known attacks,
    assuming the standard deviation of the noise distribution is left to its default
    value.

    @param[in] poly_modulus_degree The degree of the polynomial modulus
    @throws std::out_of_range if poly_modulus_degree is not 1024, 2048, 4096, 8192, 16384, or 32768

</member>
<member name="M:seal.small_mods_60bit(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\defaultparams.h" line="81">
    Returns a 60-bit coefficient modulus prime.

    @param[in] index The list index of the prime
    @throws std::out_of_range if index is not within [0, 64)

</member>
<member name="M:seal.small_mods_50bit(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\defaultparams.h" line="100">
    Returns a 50-bit coefficient modulus prime.

    @param[in] index The list index of the prime
    @throws std::out_of_range if index is not within [0, 64)

</member>
<member name="M:seal.small_mods_40bit(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\defaultparams.h" line="119">
    Returns a 40-bit coefficient modulus prime.

    @param[in] index The list index of the prime
    @throws std::out_of_range if index is not within [0, 64)

</member>
<member name="M:seal.small_mods_30bit(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\defaultparams.h" line="138">
    Returns a 30-bit coefficient modulus prime.

    @param[in] index The list index of the prime
    @throws std::out_of_range if index is not within [0, 64)

</member>
<member name="M:seal.dbc_max" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\defaultparams.h" line="157">
Returns the largest allowed decomposition bit count (60).

</member>
<member name="M:seal.dbc_min" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\defaultparams.h" line="165">
Returns the smallest allowed decomposition bit count (1).

</member>
<member name="T:seal.EncryptionParameters" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encryptionparams.h" line="16">
    Represents user-customizable encryption scheme settings. The parameters (most 
    importantly poly_modulus, coeff_modulus, plain_modulus) significantly affect 
    the performance, capabilities, and security of the encryption scheme. Once 
    an instance of EncryptionParameters is populated with appropriate parameters, 
    it can be used to create an instance of the SEALContext class, which verifies
    the validity of the parameters, and performs necessary pre-computations.

    Picking appropriate encryption parameters is essential to enable a particular
    application while balancing performance and security. Some encryption settings
    will not allow some inputs (e.g. attempting to encrypt a polynomial with more
    coefficients than poly_modulus or larger coefficients than plain_modulus) or,
    support the desired computations (with noise growing too fast due to too large 
    plain_modulus and too small coeff_modulus).

    @par Hash Block
    The EncryptionParameters class maintains at all times a 256-bit SHA-3 hash of 
    the currently set encryption parameters. This hash is then stored by all further
    objects created for these encryption parameters, e.g. SEALContext, KeyGenerator,
    Encryptor, Decryptor, Evaluator, all secret and public keys, and ciphertexts.
    The hash block is not intended to be directly modified by the user, and is used
    internally to perform quick input compatibility checks.

    @par Thread Safety
    In general, reading from EncryptionParameters is thread-safe, while mutating is not.

    @warning Choosing inappropriate encryption parameters may lead to an encryption
    scheme that is not secure, does not perform well, and/or does not support the
    input and computation of the desired application. We highly recommend consulting
    an expert in RLWE-based encryption when selecting parameters, as this is where
    inexperienced users seem to most often make critical mistakes.

</member>
<member name="D:seal.EncryptionParameters.hash_block_type" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encryptionparams.h" line="51">
The data type to store a hash block.

</member>
<member name="M:seal.EncryptionParameters.#ctor" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encryptionparams.h" line="56">
Creates an empty set of encryption parameters. At a minimum, the user needs to 
specify the parameters poly_modulus, coeff_modulus, and plain_modulus for the
parameters to be usable.

</member>
<member name="M:seal.EncryptionParameters.set_poly_modulus(seal.BigPoly!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encryptionparams.h" line="63">
        Creates a copy of a given instance of EncryptionParameters.

        @param[in] copy The EncryptionParameters to copy from

        Overwrites the EncryptionParameters instance with a copy of a given instance.

        @param[in] assign The EncryptionParameters to copy from

        Creates a new EncryptionParameters instance by moving a given instance.

        @param[in] source The EncryptionParameters to move from

        Overwrites the EncryptionParameters instance by moving a given instance.

        @param[in] assign The EncryptionParameters to move from

        Sets the polynomial modulus parameter to the specified value (represented by 
        BigPoly). The polynomial modulus directly affects the number of coefficients 
        in plaintext polynomials, the size of ciphertext elements, the computational
        performance of the scheme (bigger is worse), and the security level (bigger 
        is better). In SEAL the polynomial modulus must be of the form "1x^N + 1",
        where N is a power of 2 (e.g. 1024, 2048, 4096, 8192, 16384, or 32768).

        @param[in] poly_modulus The new polynomial modulus
        @throws std::invalid_argument if poly_modulus is too large

</member>
<member name="M:seal.EncryptionParameters.set_poly_modulus(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encryptionparams.h" line="121">
        Sets the polynomial modulus parameter to the specified value (represented by
        std::string). The polynomial modulus directly affects the number of coefficients
        in plaintext polynomials, the size of ciphertext elements, the computational
        performance of the scheme (bigger is worse), and the security level (bigger 
        is better). In SEAL the polynomial modulus must be of the form "1x^N + 1",
        where N is a power of 2 (e.g. 1024, 2048, 4096, 8192, 16384, or 32768).

        @param[in] poly_modulus The new polynomial modulus
        @throws std::invalid_argument if poly_modulus is too large

</member>
<member name="M:seal.EncryptionParameters.set_coeff_modulus(std.vector&lt;seal.SmallModulus,std.allocator&lt;seal.SmallModulus&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encryptionparams.h" line="138">
        Sets the coefficient modulus parameter. The coefficient modulus consists of a list 
        of distinct prime numbers, and is represented by a vector of SmallModulus objects. 
        The coefficient modulus directly affects the size of ciphertext elements, the 
        amount of computation that the scheme can perform (bigger is better), and the 
        security level (bigger is worse). In SEAL each of the prime numbers in the 
        coefficient modulus must be at most 60 bits, and must be congruent to 1 modulo 
        2*degree(poly_modulus).

        @param[in] coeff_modulus The new coefficient modulus
        @throws std::invalid_argument if size of coeff_modulus is too large

</member>
<member name="M:seal.EncryptionParameters.set_plain_modulus(seal.SmallModulus!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encryptionparams.h" line="163">
        Sets the plaintext modulus parameter. The plaintext modulus is an integer modulus
        represented by the SmallModulus class. The plaintext modulus determines the largest
        coefficient that plaintext polynomials can represent. It also affects the amount of
        computation that the scheme can perform (bigger is worse). In SEAL the plaintext 
        modulus can be at most 60 bits long, but can otherwise be any integer. Note, however, 
        that some features (e.g. batching) require the plaintext modulus to be of a particular 
        form. 

        @param[in] plain_modulus The new plaintext modulus

</member>
<member name="M:seal.EncryptionParameters.set_plain_modulus(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encryptionparams.h" line="182">
        Sets the plaintext modulus parameter. The plaintext modulus is an integer modulus
        represented by the SmallModulus class. This constructor instead takes a std::uint64_t
        and automatically creates the SmallModulus object. The plaintext modulus determines 
        the largest coefficient that plaintext polynomials can represent. It also affects the 
        amount of computation that the scheme can perform (bigger is worse). In SEAL the 
        plaintext modulus can be at most 60 bits long, but can otherwise be any integer. Note,
        however, that some features (e.g. batching) require the plaintext modulus to be of 
        a particular form.

        @param[in] plain_modulus The new plaintext modulus

</member>
<member name="M:seal.EncryptionParameters.set_noise_standard_deviation(System.Double)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encryptionparams.h" line="199">
        Sets the standard deviation of the noise distribution used for error sampling. This 
        parameter directly affects the security level of the scheme. However, it should not be
        necessary for most users to change this parameter from its default value.

        @param[in] noise_standard_deviation The new standard deviation

</member>
<member name="M:seal.EncryptionParameters.set_random_generator(seal.UniformRandomGeneratorFactory*)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encryptionparams.h" line="216">
        Sets the random number generator factory to use for encryption. By default, the random
        generator is set to UniformRandomGeneratorFactory::default_factory(). Setting this value
        allows a user to specify a custom random number generator source.

        @param[in] random_generator Pointer to the random generator factory

</member>
<member name="M:seal.EncryptionParameters.poly_modulus" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encryptionparams.h" line="228">
Returns a const reference to the currently set polynomial modulus parameter.

</member>
<member name="M:seal.EncryptionParameters.coeff_modulus" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encryptionparams.h" line="236">
Returns a const reference to the currently set coefficient modulus parameter.

</member>
<member name="M:seal.EncryptionParameters.plain_modulus" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encryptionparams.h" line="244">
Returns a const reference to the currently set plaintext modulus parameter.

</member>
<member name="M:seal.EncryptionParameters.noise_standard_deviation" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encryptionparams.h" line="252">
Returns the currently set standard deviation of the noise distribution.

</member>
<member name="M:seal.EncryptionParameters.noise_max_deviation" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encryptionparams.h" line="260">
Returns the currently set maximum deviation of the noise distribution. This value
cannot be directly controlled by the user, and is automatically set to be an 
appropriate multiple of the noise_standard_deviation parameter.

</member>
<member name="M:seal.EncryptionParameters.random_generator" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encryptionparams.h" line="270">
Returns a pointer to the random number generator factory to use for encryption.

</member>
<member name="M:seal.EncryptionParameters.op_Equality(seal.EncryptionParameters!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encryptionparams.h" line="278">
        Compares a given set of encryption parameters to the current set of encryption 
        parameters. The comparison is performed by comparing hash blocks of the parameter 
        sets rather than comparing the parameters individually.

        @parms[in] other The EncryptionParameters to compare against

</member>
<member name="M:seal.EncryptionParameters.op_Inequality(seal.EncryptionParameters!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encryptionparams.h" line="290">
        Compares a given set of encryption parameters to the current set of encryption
        parameters. The comparison is performed by comparing hash blocks of the parameter
        sets rather than comparing the parameters individually.

        @parms[in] other The EncryptionParameters to compare against

</member>
<member name="M:seal.EncryptionParameters.save(std.basic_ostream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encryptionparams.h" line="302">
        Saves the EncryptionParameters to an output stream. The output is in binary format
        and is not human-readable. The output stream must have the "Binary" flag set.

        @param[in] stream The stream to save the EncryptionParameters to
        @see load() to load a saved EncryptionParameters instance.

</member>
<member name="M:seal.EncryptionParameters.load(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encryptionparams.h" line="311">
        Loads the EncryptionParameters from an input stream overwriting the current 
        EncryptionParameters.

        @param[in] stream The stream to load the EncryptionParameters from
        @see save() to save an EncryptionParameters instance.

</member>
<member name="M:seal.EncryptionParameters.hash_block" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encryptionparams.h" line="320">
Returns the hash block of the current parameters. This function is intended
mainly for internal use.

</member>
<member name="T:seal.EncryptionParameters.EncryptionParametersPrivateHelper" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encryptionparams.h" line="329">
Enables access to private members of seal::EncryptionParameters for .NET wrapper.

</member>
<member name="T:seal.Plaintext" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="14">
    Class to store a plaintext element. The data for the plaintext is a polynomial with coefficients
    modulo the plaintext modulus. The degree of the plaintext polynomial must be one less than the 
    degree of the polynomial modulus. The backing array always allocates one 64-bit word per each
    coefficient of the polynoimal.

    @par Memory Management
    SEAL allocates the memory for a plaintext by default from the global memory pool, but a user can
    alternatively specify a different memory pool to be used through the MemoryPoolHandle class. This
    can be important, as constructing or resizing several plaintexts at once allocated in the global
    memory pool can quickly lead to contention and poor performance in multi-threaded applications.
    In addition to its coefficient count, a plaintext also has a capacity which denotes the coefficient
    count that fits in the current allocation. Since each coefficient is a 64-bit word, this is exactly
    the number of 64-bit words that are allocated. In high-performance applications unnecessary 
    re-allocations should also be avoided by reserving enough memory for the plaintext to begin with 
    either by providing the capacity to the constructor as an extra argument, or by calling the reserve 
    function at any time.

    @par Aliased Plaintexts
    By default a plaintext manages its own memory. However, in some cases the user might want to e.g.
    pre-allocate a large continuous block of memory to be used by several plaintexts. In this case
    it is possible to create aliased plaintextds by simply giving the constructor a pointer to the
    memory location, and the relevant size parameters, including the capacity. The allocation size of
    an aliased plaintext cannot be changed with the reserve function, unless it is first reallocated
    in a memory pool using the unalias function.

    @par Thread Safety
    In general, reading from plaintext is thread-safe as long as no other thread is concurrently
    mutating it. This is due to the underlying data structure storing the plaintext not being
    thread-safe.

    @see Ciphertext for the class that stores ciphertexts.

</member>
<member name="M:seal.Plaintext.#ctor(seal.MemoryPoolHandle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="50">
Constructs an empty plaintext allocating no memory.

        Constructs an empty plaintext allocating no memory. The memory pool is set to the pool pointed
        to by the given MemoryPoolHandle.

        @param[in] pool The MemoryPoolHandle pointing to a valid memory pool
        @throws std::invalid_argument if pool is uninitialized

</member>
<member name="M:seal.Plaintext.#ctor(System.Int32,seal.MemoryPoolHandle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="71">
        Constructs a plaintext representing a constant polynomial 0. The coefficient count of the
        polynomial is set to the given value. The capacity is set to the same value. The memory pool
        is set to the pool pointed to by the given MemoryPoolHandle, or the global memory pool by default.

        @param[in] coeff_count The number of (zeroed) coefficients in the plaintext polynomial
        @param[in] pool The MemoryPoolHandle pointing to a valid memory pool
        @throws std::invalid_argument if coeff_count is negative
        @throws std::invalid_argument if pool is uninitialized

</member>
<member name="M:seal.Plaintext.#ctor(System.Int32,System.Int32,seal.MemoryPoolHandle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="87">
        Constructs a plaintext representing a constant polynomial 0. The coefficient count of the
        polynomial and the capacity are set to the given values. The memory pool is set to the pool 
        pointed to by the given MemoryPoolHandle, or the global memory pool by default.

        @param[in] capacity The capacity
        @param[in] coeff_count The number of (zeroed) coefficients in the plaintext polynomial
        @param[in] pool The MemoryPoolHandle pointing to a valid memory pool
        @throws std::invalid_argument if capacity is less than coeff_count
        @throws std::invalid_argument if coeff_count is negative
        @throws std::invalid_argument if pool is uninitialized

</member>
<member name="M:seal.Plaintext.#ctor(System.Int32,System.UInt64*)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="111">
        Constructs an aliased plaintext with backing array located at the given address and with given
        coefficient count. The capacity is set to same value.

        @param[in] coeff_count The number of coefficients in the plaintext polynomial
        @param[in] poly A pointer to the backing array of the plaintext
        @throws std::invalid_argument if coeff_count is negative
        @throws std::invalid_argument if poly is null and coeff_count is positive

</member>
<member name="M:seal.Plaintext.#ctor(System.Int32,System.Int32,System.UInt64*)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="125">
        Constructs an aliased plaintext with backing array located at the given address, with given
        coefficient count and given capacity.

        @param[in] capacity The capacity
        @param[in] coeff_count The number of coefficients in the plaintext polynomial
        @param[in] poly A pointer to the backing array of the plaintext
        @throws std::invalid_argument if capacity is less than coeff_count
        @throws std::invalid_argument if coeff_count is negative
        @throws std::invalid_argument if poly is null and coeff_count is positive

</member>
<member name="M:seal.Plaintext.#ctor(seal.BigPoly!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,seal.MemoryPoolHandle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="177">
        Constructs a plaintext and sets its value to the polynomial represented by the given BigPoly.
        The memory pool is set to the pool pointed to by the given MemoryPoolHandle, or the global 
        memory pool by default.

        @param[in] poly The plaintext polynomial
        @param[in] pool The MemoryPoolHandle pointing to a valid memory pool
        @throws std::invalid_argument if pool is uninitialized

</member>
<!-- Discarding badly formed XML document comment for member 'M:seal.Plaintext.#ctor(std.basic_string<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte>>!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,seal.MemoryPoolHandle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)'. -->
<member name="M:seal.Plaintext.#ctor(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="227">
        Constructs a new plaintext by copying a given one.

        @param[in] copy The plaintext to copy from

</member>
<member name="M:seal.Plaintext.alias(System.Int32,System.UInt64*)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="243">
        Constructs a new plaintext by moving a given one.

        @param[in] source The plaintext to move from

        Changes the plaintext to be an aliased plaintext with backing array located at the given
        address and with given coefficient count. The capacity is set to equal the coefficient
        count. Any previous allocation is released back to the memory pool (unless aliased).

        @param[in] coeff_count The number of coefficients in the plaintext polynomial
        @param[in] poly A pointer to the backing array of the plaintext
        @throws std::invalid_argument if coeff_count is negative
        @throws std::invalid_argument if poly is null and coeff_count is positive

</member>
<member name="M:seal.Plaintext.alias(System.Int32,System.Int32,System.UInt64*)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="276">
        Changes the plaintext to be an aliased plaintext with backing array located at the given
        address and with given coefficient count. The capacity is set to equal the coefficient
        count. Any previous allocation is released back to the memory pool (unless aliased).

        @param[in] coeff_count The number of coefficients in the plaintext polynomial
        @param[in] poly A pointer to the backing array of the plaintext
        @throws std::invalid_argument if capacity is less than coeff_count
        @throws std::invalid_argument if coeff_count is negative
        @throws std::invalid_argument if poly is null and coeff_count is positive

</member>
<member name="M:seal.Plaintext.unalias(seal.MemoryPoolHandle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="345">
        Reallocates an aliased plaintext from the memory pool pointed to by the given
        MemoryPoolHandle. An aliased plaintext is no longer aliased after this function is called.

        @param[in] pool The MemoryPoolHandle pointing to a valid memory pool
        @throws std::invalid_argument if the plaintext is not aliased
        @throws std::invalid_argument if pool is uninitialized

</member>
<member name="M:seal.Plaintext.unalias" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="355">
        Reallocates an aliased plaintext from the memory pool pointed to by the currently held
        MemoryPoolHandle. If the currently held MemoryPoolHandle is uninitialized, it is set to
        point to the global memory pool instead, and the memory is allocated from the global
        memory pool. An aliased plaintext is no longer aliased after this function is called.

        @throws std::invalid_argument if the plaintext is not aliased

</member>
<member name="M:seal.Plaintext.reserve(System.Int32,seal.MemoryPoolHandle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="372">
        Allocates enough memory to accommodate the backing array of a plaintext with given
        capacity. The allocation is made from the memory pool pointed to by the given
        MemoryPoolHandle.

        @param[in] capacity The capacity
        @param[in] pool The MemoryPoolHandle pointing to a valid memory pool
        @throws std::invalid_argument if capacity is negative
        @throws std::invalid_argument if pool is uninitialized
        @throws std::logic_error if the plaintext is aliased

</member>
<member name="M:seal.Plaintext.reserve(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="385">
        Allocates enough memory to accommodate the backing array of a plaintext with given
        capacity. The allocation is made from the memory pool pointed to by the currently held
        MemoryPoolHandle. If the currently held MemoryPoolHandle is uninitialized, it is set to
        point to the global memory pool instead, and the memory is allocated from the global
        memory pool.

        @param[in] capacity The capacity
        @throws std::invalid_argument if capacity is negative
        @throws std::logic_error if the plaintext is aliased

</member>
<member name="M:seal.Plaintext.release" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="405">
Resets the plaintext. This function releases any memory allocated by the plaintext,
returning it to the memory pool pointed to by the current MemoryPoolHandle, if the plaintext
is not aliased.

</member>
<member name="M:seal.Plaintext.resize(System.Int32,seal.MemoryPoolHandle!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="417">
        Resizes the plaintext to have a given coefficient count. The plaintext is automatically
        reallocated if the new coefficient count does not fit in the current capacity. If the
        plaintext is not aliased, the allocation is made from the memory pool pointed to by the 
        given MemoryPoolHandle. If the plaintext is aliased, the coefficient count is simply 
        increased within the current capacity, and an exception is thrown if the current capacity 
        is exceeded.

        @param[in] coeff_count The number of coefficients in the plaintext polynomial
        @param[in] pool The MemoryPoolHandle pointing to a valid memory pool
        @throws std::invalid_argument if coeff_count is negative
        @throws std::invalid_argument if pool is uninitialized and the plaintext is not aliased
        @throws std::invalid_argument if pool is different from the current pool and the plaintext is aliased
        @throws std::logic_error if coeff_count is larger than the current capacity and the plaintext is aliased

</member>
<member name="M:seal.Plaintext.resize(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="434">
        Resizes the plaintext to have a given coefficient count. The plaintext is automatically
        reallocated if the new coefficient count does not fit in the current capacity. If the
        plaintext is not aliased, the allocation is made from the memory pool pointed to by the 
        currently held MemoryPoolHandle. If the currently held MemoryPoolHandle is uninitialized, 
        it is set to point to the global memory pool instead, and the memory is allocated from the
        global memory pool. If the plaintext is aliased, the coefficient count is simply increased
        within the current capacity, and an exception is thrown if the current capacity is exceeded.

        @param[in] coeff_count The number of coefficients in the plaintext polynomial
        @throws std::invalid_argument if coeff_count is negative
        @throws std::logic_error if coeff_count is larger than the current capacity and the plaintext is aliased

</member>
<member name="M:seal.Plaintext.op_Assign(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="457">
        Copies a given plaintext to the current one.

        @param[in] assign The plaintext to copy from

</member>
<member name="M:seal.Plaintext.op_Assign(seal.BigPoly!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="480">
        Moves a given plaintext to the current one.

        @param[in] assign The plaintext to move from

        Sets the value of the current plaintext to the polynomial represented by the given BigPoly.

        @param[in] poly The plaintext polynomial
        @throws std::invalid_argument if the coefficients of poly are too wide
        @throws std::logic_error if the plaintext is aliased and the capacity is too small to fit poly

</member>
<!-- Discarding badly formed XML document comment for member 'M:seal.Plaintext.op_Assign(std.basic_string<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte>>!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)'. -->
<member name="M:seal.Plaintext.op_Assign(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="517">
        Sets the value of the current plaintext to a given constant polynomial. The coefficient count
        is set to one.

        @param[in] const_coeff The constant coefficient
        @throws std::logic_error if the plaintext is aliased and has a capacity of zero

</member>
<member name="M:seal.Plaintext.set_zero(System.Int32,System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="531">
        Sets a given range of coefficients of a plaintext polynomial to zero.

        @param[in] start_coeff The index of the first coefficient to set to zero
        @param[in] length The number of coefficients to set to zero
        @throws std::out_of_range if start_coeff is not within [0, coeff_count)
        @throws std::out_of_range if length is negative or start_coeff + length is not within [0, coeff_count)

</member>
<member name="M:seal.Plaintext.set_zero(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="552">
        Sets the plaintext polynomial coefficients to zero starting at a given index.

        @param[in] start_coeff The index of the first coefficient to set to zero
        @throws std::out_of_range if start_coeff is not within [0, coeff_count)

</member>
<member name="M:seal.Plaintext.set_zero" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="567">
Sets the plaintext polynomial to zero.

</member>
<member name="M:seal.Plaintext.data" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="575">
Returns a pointer to the beginning of the plaintext polynomial.

</member>
<member name="M:seal.Plaintext.data" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="583">
Returns a const pointer to the beginning of the plaintext polynomial.

</member>
<member name="M:seal.Plaintext.data(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="609">
        Returns a pointer to a given coefficient of the plaintext polynomial.

        @param[in] coeff_index The index of the coefficient in the plaintext polynomial
        @throws std::out_of_range if coeff_index is not within [0, coeff_count)

</member>
<member name="M:seal.Plaintext.data(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="628">
        Returns a const pointer to a given coefficient of the plaintext polynomial.

        @param[in] coeff_index The index of the coefficient in the plaintext polynomial
        @throws std::out_of_range if coeff_index is not within [0, coeff_count)

</member>
<member name="M:seal.Plaintext.op_Subscript(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="647">
        Returns a const reference to a given coefficient of the plaintext polynomial.

        @param[in] coeff_index The index of the coefficient in the plaintext polynomial
        @throws std::out_of_range if coeff_index is not within [0, coeff_count)

</member>
<member name="M:seal.Plaintext.op_Subscript(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="662">
        Returns a reference to a given coefficient of the plaintext polynomial.

        @param[in] coeff_index The index of the coefficient in the plaintext polynomial
        @throws std::out_of_range if coeff_index is not within [0, coeff_count)

</member>
<member name="M:seal.Plaintext.op_Equality(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="677">
        Returns whether or not the plaintext has the same semantic value as a given plaintext. 
        Leading zero coefficients are ignored by the comparison.

        @param[in] compare The plaintext to compare against

</member>
<member name="M:seal.Plaintext.op_Inequality(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="693">
        Returns whether or not the plaintext has a different semantic value than a given 
        plaintext. Leading zero coefficients are ignored by the comparison.

        @param[in] compare The plaintext to compare against

</member>
<member name="M:seal.Plaintext.is_zero" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="704">
Returns whether the current plaintext polynomial has all zero coefficients.

</member>
<member name="M:seal.Plaintext.is_alias" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="712">
Returns whether the current plaintext is an alias.

</member>
<member name="M:seal.Plaintext.capacity" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="720">
Returns the capacity of the current allocation.

</member>
<member name="M:seal.Plaintext.coeff_count" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="728">
Returns the coefficient count of the current plaintext polynomial.

</member>
<member name="M:seal.Plaintext.significant_coeff_count" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="736">
Returns the significant coefficient count of the current plaintext polynomial.

</member>
<!-- Discarding badly formed XML document comment for member 'M:seal.Plaintext.to_string'. -->
<member name="M:seal.Plaintext.save(std.basic_ostream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="767">
        Saves the Plaintext to an output stream. The output is in binary format and not human-readable. 
        The output stream must have the "binary" flag set.

        @param[in] stream The stream to save the plaintext to
        @see load() to load a saved plaintext.

</member>
<member name="M:seal.Plaintext.load(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="776">
        Loads a Plaintext from an input stream overwriting the current plaintext.

        @param[in] stream The stream to load the plaintext from
        @see save() to save a plaintext.

</member>
<member name="M:seal.Plaintext.pool" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\plaintext.h" line="784">
Returns a copy of the MemoryPoolHandle.

</member>
<member name="T:seal.BinaryEncoder" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="84">
    Encodes integers into plaintext polynomials that Encryptor can encrypt. An instance of
    the BinaryEncoder class converts an integer into a plaintext polynomial by placing its
    binary digits as the coefficients of the polynomial. Decoding the integer amounts to
    evaluating the plaintext polynomial at X=2.

    Addition and multiplication on the integer side translate into addition and multiplication
    on the encoded plaintext polynomial side, provided that the length of the polynomial
    never grows to be of the size of the polynomial modulus (poly_modulus), and that the
    coefficients of the plaintext polynomials appearing throughout the computations never
    experience coefficients larger than the plaintext modulus (plain_modulus).

    @par Negative Integers
    Negative integers are represented by using -1 instead of 1 in the binary representation,
    and the negative coefficients are stored in the plaintext polynomials as unsigned integers
    that represent them modulo the plaintext modulus. Thus, for example, a coefficient of -1
    would be stored as a polynomial coefficient plain_modulus-1.

    @par Decoding Overflow
    In many cases it is a bad idea to throw an exception when decoding fails due to an overflow
    condition, e.g. decode_uint32 is given a polynomial that decodes into a value larger than
    32 bits. If such an exception is not handled silently, a malicious observer might notice
    this happening, and be able to extract one bit of information about the secret key.
    Thus, by default, the decoder functions do not throw exceptions in cases of overflow.
    However, the throws are automatically enabled in debug mode in Visual Studio, and more
    generally they can be directly controlled by the preprocessor define SEAL_THROW_ON_DECODER_OVERFLOW
    in the file util/defines.h.

    @see BinaryFractionalEncoder for encoding real numbers.
    @see BalancedEncoder for encoding using base-b representation for b greater than 2.
    @see IntegerEncoder for a common interface to all integer encoders.

</member>
<member name="M:seal.BinaryEncoder.#ctor(seal.SmallModulus!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="119">
        Creates a BinaryEncoder object. The constructor takes as input a reference
        to the plaintext modulus (represented by SmallModulus). 

        @param[in] plain_modulus The plaintext modulus (represented by SmallModulus)
        @throws std::invalid_argument if plain_modulus is not at least 2

</member>
<member name="M:seal.BinaryEncoder.Dispose" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="128">
        Creates a copy of a BinaryEncoder.

        @param[in] copy The BinaryEncoder to copy from

        Creates a new BinaryEncoder by moving an old one.

        @param[in] source The BinaryEncoder to move from

Destroys the BinaryEncoder.

</member>
<member name="M:seal.BinaryEncoder.encode(System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="149">
        Encodes an unsigned integer (represented by std::uint64_t) into a plaintext polynomial.

        @param[in] value The unsigned integer to encode

</member>
<member name="M:seal.BinaryEncoder.encode(System.UInt64,seal.Plaintext*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="156">
        Encodes an unsigned integer (represented by std::uint64_t) into a plaintext polynomial.

        @param[in] value The unsigned integer to encode
        @param[out] destination The plaintext to overwrite with the encoding

</member>
<member name="M:seal.BinaryEncoder.decode_uint32(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="164">
        Decodes a plaintext polynomial and returns the result as std::uint32_t.
        Mathematically this amounts to evaluating the input polynomial at X=2.

        @param[in] plain The plaintext to be decoded
        @throws std::invalid_argument if the output does not fit in std::uint32_t (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)

</member>
<member name="M:seal.BinaryEncoder.decode_uint64(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="173">
        Decodes a plaintext polynomial and returns the result as std::uint64_t.
        Mathematically this amounts to evaluating the input polynomial at X=2.

        @param[in] plain The plaintext to be decoded
        @throws std::invalid_argument if the output does not fit in std::uint64_t (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)

</member>
<member name="M:seal.BinaryEncoder.encode(System.Int64)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="182">
        Encodes a signed integer (represented by std::uint64_t) into a plaintext polynomial.

        @par Negative Integers
        Negative integers are represented by using -1 instead of 1 in the binary representation,
        and the negative coefficients are stored in the plaintext polynomials as unsigned integers
        that represent them modulo the plaintext modulus. Thus, for example, a coefficient of -1
        would be stored as a polynomial coefficient plain_modulus-1.

        @param[in] value The signed integer to encode

</member>
<member name="M:seal.BinaryEncoder.encode(System.Int64,seal.Plaintext*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="195">
        Encodes a signed integer (represented by std::int64_t) into a plaintext polynomial.

        @par Negative Integers
        Negative integers are represented by using -1 instead of 1 in the binary representation,
        and the negative coefficients are stored in the plaintext polynomials as unsigned integers
        that represent them modulo the plaintext modulus. Thus, for example, a coefficient of -1
        would be stored as a polynomial coefficient plain_modulus-1.

        @param[in] value The signed integer to encode
        @param[out] destination The plaintext to overwrite with the encoding

</member>
<member name="M:seal.BinaryEncoder.encode(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="209">
        Encodes an unsigned integer (represented by BigUInt) into a plaintext polynomial.

        @param[in] value The unsigned integer to encode

</member>
<member name="M:seal.BinaryEncoder.encode(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,seal.Plaintext*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="216">
        Encodes an unsigned integer (represented by BigUInt) into a plaintext polynomial.

        @param[in] value The unsigned integer to encode
        @param[out] destination The plaintext to overwrite with the encoding

</member>
<member name="M:seal.BinaryEncoder.decode_int32(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="224">
        Decodes a plaintext polynomial and returns the result as std::int32_t.
        Mathematically this amounts to evaluating the input polynomial at X=2.

        @param[in] plain The plaintext to be decoded
        @throws std::invalid_argument if plain does not represent a valid plaintext polynomial
        @throws std::invalid_argument if the output does not fit in std::int32_t (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)

</member>
<member name="M:seal.BinaryEncoder.decode_int64(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="234">
        Decodes a plaintext polynomial and returns the result as std::int64_t.
        Mathematically this amounts to evaluating the input polynomial at X=2.

        @param[in] plain The plaintext to be decoded
        @throws std::invalid_argument if plain does not represent a valid plaintext polynomial
        @throws std::invalid_argument if the output does not fit in std::int64_t (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)

</member>
<member name="M:seal.BinaryEncoder.decode_biguint(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="244">
        Decodes a plaintext polynomial and returns the result as BigUInt.
        Mathematically this amounts to evaluating the input polynomial at X=2.

        @param[in] plain The plaintext to be decoded
        @throws std::invalid_argument if plain does not represent a valid plaintext polynomial
        @throws std::invalid_argument if the output is negative

</member>
<member name="M:seal.BinaryEncoder.decode_biguint(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,seal.BigUInt*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="254">
        Decodes a plaintext polynomial and stores the result in a given BigUInt.
        Mathematically this amounts to evaluating the input polynomial at X=2.

        @param[in] plain The plaintext to be decoded
        @param[out] destination The BigUInt to overwrite with the decoding
        @throws std::invalid_argument if plain does not represent a valid plaintext polynomial
        @throws std::invalid_argument if the output does not fit in destination
        @throws std::invalid_argument if the output is negative (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)

</member>
<member name="M:seal.BinaryEncoder.encode(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="266">
        Encodes a signed integer (represented by std::int32_t) into a plaintext polynomial.

        @par Negative Integers
        Negative integers are represented by using -1 instead of 1 in the binary representation,
        and the negative coefficients are stored in the plaintext polynomials as unsigned integers
        that represent them modulo the plaintext modulus. Thus, for example, a coefficient of -1
        would be stored as a polynomial coefficient plain_modulus-1.

        @param[in] value The signed integer to encode

</member>
<member name="M:seal.BinaryEncoder.encode(System.UInt32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="282">
        Encodes an unsigned integer (represented by std::uint32_t) into a plaintext polynomial.

        @param[in] value The unsigned integer to encode

</member>
<member name="M:seal.BinaryEncoder.encode(System.Int32,seal.Plaintext*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="292">
        Encodes a signed integer (represented by std::int32_t) into a plaintext polynomial.

        @par Negative Integers
        Negative integers are represented by using -1 instead of 1 in the binary representation,
        and the negative coefficients are stored in the plaintext polynomials as unsigned integers
        that represent them modulo the plaintext modulus. Thus, for example, a coefficient of -1
        would be stored as a polynomial coefficient plain_modulus-1.

        @param[in] value The signed integer to encode
        @param[out] destination The plaintext to overwrite with the encoding

</member>
<member name="M:seal.BinaryEncoder.encode(System.UInt32,seal.Plaintext*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="309">
        Encodes an unsigned integer (represented by std::uint32_t) into a plaintext polynomial.

        @param[in] value The unsigned integer to encode
        @param[out] destination The plaintext to overwrite with the encoding

</member>
<member name="M:seal.BinaryEncoder.plain_modulus" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="320">
Returns a reference to the plaintext modulus.

</member>
<member name="M:seal.BinaryEncoder.base" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="328">
<summary>Returns the base used for encoding (2).</summary>

</member>
<member name="T:seal.BalancedEncoder" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="352">
    Encodes integers into plaintext polynomials that Encryptor can encrypt. An instance of
    the BalancedEncoder class converts an integer into a plaintext polynomial by placing its
    digits in balanced base-b representation as the coefficients of the polynomial. The base
    b must be a positive integer at least 3 (which is the default value). When b is odd,
    digits in such a balanced representation are integers in the range
    -(b-1)/2,...,(b-1)/2. When b is even, digits are integers in the range -b/2,..., b/2-1.
    Note that the default value 3 for the base b allows for more compact representation than
    BinaryEncoder without increasing the sizes of the coefficients of freshly encoded plaintext
    polynomials. A larger base allows for an even more compact representation at the cost of
    having larger coefficients in freshly encoded plaintext polynomials. Decoding the integer
    amounts to evaluating the plaintext polynomial at X=b.

    Addition and multiplication on the integer side translate into addition and multiplication
    on the encoded plaintext polynomial side, provided that the length of the polynomial
    never grows to be of the size of the polynomial modulus (poly_modulus), and that the
    coefficients of the plaintext polynomials appearing throughout the computations never
    experience coefficients larger than the plaintext modulus (plain_modulus).

    @par Negative Integers
    Negative integers in the balanced base-b encoding are represented the same way as
    positive integers, namely, both positive and negative integers can have both positive and negative
    digits in their balanced base-b representation. Negative coefficients are stored in the
    plaintext polynomials as unsigned integers that represent them modulo the plaintext modulus.
    Thus, for example, a coefficient of -1 would be stored as a polynomial coefficient plain_modulus-1.

    @par Decoding Overflow
    In many cases it is a bad idea to throw an exception when decoding fails due to an overflow
    condition, e.g. decode_uint32 is given a polynomial that decodes into a value larger than
    32 bits. If such an exception is not handled silently, a malicious observer might notice
    this happening, and be able to extract one bit of information about the secret key.
    Thus, by default, the decoder functions do not throw exceptions in cases of overflow.
    However, the throws are automatically enabled in debug mode in Visual Studio, and more
    generally they can be directly controlled by the preprocessor define SEAL_THROW_ON_DECODER_OVERFLOW
    in the file util/defines.h.

    @see BalancedFractionalEncoder for encoding real numbers.
    @see BinaryEncoder for encoding using the binary representation.
    @see IntegerEncoder for a common interface to all integer encoders.

</member>
<member name="M:seal.BalancedEncoder.#ctor(seal.SmallModulus!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="395">
        Creates a BalancedEncoder object. The constructor takes as input a reference
        to the plaintext modulus (represented by SmallModulus), and optionally an integer,
        at least 3, that is used as a base in the encoding.

        @param[in] plain_modulus The plaintext modulus (represented by SmallModulus)
        @param[in] base The base to be used for encoding (default value is 3)
        @throws std::invalid_argument if base is not an integer and at least 3
        @throws std::invalid_argument if plain_modulus is not at least base

</member>
<member name="M:seal.BalancedEncoder.Dispose" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="407">
        Creates a copy of a BalancedEncoder.

        @param[in] copy The BalancedEncoder to copy from

        Creates a new BalancedEncoder by moving an old one.

        @param[in] source The BalancedEncoder to move from

Destroys the BalancedEncoder.

</member>
<member name="M:seal.BalancedEncoder.encode(System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="428">
        Encodes an unsigned integer (represented by std::uint64_t) into a plaintext polynomial.

        @param[in] value The unsigned integer to encode

</member>
<member name="M:seal.BalancedEncoder.encode(System.UInt64,seal.Plaintext*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="435">
        Encodes an unsigned integer (represented by std::uint64_t) into a plaintext polynomial.

        @param[in] value The unsigned integer to encode
        @param[out] destination The plaintext to overwrite with the encoding

</member>
<member name="M:seal.BalancedEncoder.decode_uint32(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="443">
        Decodes a plaintext polynomial and returns the result as std::uint32_t.
        Mathematically this amounts to evaluating the input polynomial at X=base.

        @param[in] plain The plaintext to be decoded
        @throws std::invalid_argument if plain does not represent a valid plaintext polynomial
        @throws std::invalid_argument if the output does not fit in std::uint32_t (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)

</member>
<member name="M:seal.BalancedEncoder.decode_uint64(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="453">
        Decodes a plaintext polynomial and returns the result as std::uint64_t.
        Mathematically this amounts to evaluating the input polynomial at X=base.

        @param[in] plain The plaintext to be decoded
        @throws std::invalid_argument if plain does not represent a valid plaintext polynomial
        @throws std::invalid_argument if the output does not fit in std::uint64_t (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)

</member>
<member name="M:seal.BalancedEncoder.encode(System.Int64)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="463">
        Encodes a signed integer (represented by std::int64_t) into a plaintext polynomial.

        @par Negative Integers
        Negative integers in the balanced base-b encoding are represented the same way as
        positive integers, namely, both positive and negative integers can have both positive and negative
        digits in their balanced base-b representation. Negative coefficients are stored in the
        plaintext polynomials as unsigned integers that represent them modulo the plaintext modulus.
        Thus, for example, a coefficient of -1 would be stored as a polynomial coefficient plain_modulus-1.

        @param[in] value The signed integer to encode

</member>
<member name="M:seal.BalancedEncoder.encode(System.Int64,seal.Plaintext*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="477">
        Encodes a signed integer (represented by std::int64_t) into a plaintext polynomial.

        @par Negative Integers
        Negative integers in the balanced base-b encoding are represented the same way as
        positive integers, namely, both positive and negative integers can have both positive and negative
        digits in their balanced base-b representation. Negative coefficients are stored in the
        plaintext polynomials as unsigned integers that represent them modulo the plaintext modulus.
        Thus, for example, a coefficient of -1 would be stored as a polynomial coefficient plain_modulus-1.

        @param[in] value The signed integer to encode
        @param[out] destination The plaintext to overwrite with the encoding

</member>
<member name="M:seal.BalancedEncoder.encode(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="492">
        Encodes an unsigned integer (represented by BigUInt) into a plaintext polynomial.

        @param[in] value The unsigned integer to encode

</member>
<member name="M:seal.BalancedEncoder.encode(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,seal.Plaintext*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="499">
        Encodes an unsigned integer (represented by BigUInt) into a plaintext polynomial.

        @param[in] value The unsigned integer to encode
        @param[out] destination The plaintext to overwrite with the encoding

</member>
<member name="M:seal.BalancedEncoder.decode_int32(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="507">
        Decodes a plaintext polynomial and returns the result as std::int32_t.
        Mathematically this amounts to evaluating the input polynomial at X=base.

        @param[in] plain The plaintext to be decoded
        @throws std::invalid_argument if plain does not represent a valid plaintext polynomial
        @throws std::invalid_argument if the output does not fit in std::int32_t (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)

</member>
<member name="M:seal.BalancedEncoder.decode_int64(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="517">
        Decodes a plaintext polynomial and returns the result as std::int64_t.
        Mathematically this amounts to evaluating the input polynomial at X=base.

        @param[in] plain The plaintext to be decoded
        @throws std::invalid_argument if plain does not represent a valid plaintext polynomial
        @throws std::invalid_argument if the output does not fit in std::int64_t (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)

</member>
<member name="M:seal.BalancedEncoder.decode_biguint(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="527">
        Decodes a plaintext polynomial and returns the result as BigUInt.
        Mathematically this amounts to evaluating the input polynomial at X=base.

        @param[in] plain The plaintext to be decoded
        @throws std::invalid_argument if plain does not represent a valid plaintext polynomial
        @throws std::invalid_argument if the output is negative (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)

</member>
<member name="M:seal.BalancedEncoder.decode_biguint(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,seal.BigUInt*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="537">
        Decodes a plaintext polynomial and stores the result in a given BigUInt.
        Mathematically this amounts to evaluating the input polynomial at X=base.

        @param[in] plain The plaintext to be decoded
        @param[out] destination The BigUInt to overwrite with the decoding
        @throws std::invalid_argument if plain does not represent a valid plaintext polynomial
        @throws std::invalid_argument if the output does not fit in destination
        @throws std::invalid_argument if the output is negative (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)

</member>
<member name="M:seal.BalancedEncoder.encode(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="549">
        Encodes a signed integer (represented by std::int32_t) into a plaintext polynomial.

        @par Negative Integers
        Negative integers in the balanced base-b encoding are represented the same way as
        positive integers, namely, both positive and negative integers can have both positive and negative
        digits in their balanced base-b representation. Negative coefficients are stored in the
        plaintext polynomials as unsigned integers that represent them modulo the plaintext modulus.
        Thus, for example, a coefficient of -1 would be stored as a polynomial coefficient plain_modulus-1.

        @param[in] value The signed integer to encode

</member>
<member name="M:seal.BalancedEncoder.encode(System.UInt32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="566">
        Encodes an unsigned integer (represented by std::uint32_t) into a plaintext polynomial.

        @param[in] value The unsigned integer to encode

</member>
<member name="M:seal.BalancedEncoder.encode(System.Int32,seal.Plaintext*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="576">
        Encodes a signed integer (represented by std::int32_t) into a plaintext polynomial.

        @par Negative Integers
        Negative integers in the balanced base-b encoding are represented the same way as
        positive integers, namely, both positive and negative integers can have both positive and negative
        digits in their balanced base-b representation. Negative coefficients are stored in the
        plaintext polynomials as unsigned integers that represent them modulo the plaintext modulus.
        Thus, for example, a coefficient of -1 would be stored as a polynomial coefficient plain_modulus-1.

        @param[in] value The signed integer to encode
        @param[out] destination The plaintext to overwrite with the encoding

</member>
<member name="M:seal.BalancedEncoder.encode(System.UInt32,seal.Plaintext*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="594">
        Encodes an unsigned integer (represented by std::uint32_t) into a plaintext polynomial.

        @param[in] value The unsigned integer to encode
        @param[out] destination The plaintext to overwrite with the encoding

</member>
<member name="M:seal.BalancedEncoder.plain_modulus" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="605">
Returns a reference to the plaintext modulus.

</member>
<member name="M:seal.BalancedEncoder.base" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="613">
Returns the base used for encoding.

</member>
<member name="T:seal.BinaryFractionalEncoder" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="637">
    Encodes floating point numbers into plaintext polynomials that Encryptor can encrypt.
    An instance of the BinaryFractionalEncoder class converts a double-precision floating-point
    number into a plaintext polynomial by computing its binary representation, encoding the
    integral part as in BinaryEncoder, and the fractional part as the highest degree
    terms of the plaintext polynomial, with signs inverted. Decoding the polynomial
    back into a double amounts to evaluating the low degree part at X=2, negating the
    coefficients of the high degree part and evaluating it at X=1/2.

    Addition and multiplication on the double side translate into addition and multiplication
    on the encoded plaintext polynomial side, provided that the integral part never mixes
    with the fractional part in the plaintext polynomials, and that the
    coefficients of the plaintext polynomials appearing throughout the computations never
    experience coefficients larger than the plaintext modulus (plain_modulus).

    @par Integral and Fractional Parts
    When homomorphic multiplications are performed, the integral part "grows up" to higher
    degree coefficients of the plaintext polynomial space, and the fractional part "grows down"
    from the top degree coefficients towards the lower degree coefficients. For decoding to work,
    these parts must not interfere with each other. When setting up the BinaryFractionalEncoder,
    one must specify how many coefficients of a plaintext polynomial are reserved for the integral
    part and how many for the fractional. The sum of these numbers can be at most equal to the
    degree of the polynomial modulus minus one. If homomorphic multiplications are performed, it is
    also necessary to leave enough room for the fractional part to "grow down".

    @par Negative Integers
    Negative integers are represented by using -1 instead of 1 in the binary representation,
    and the negative coefficients are stored in the plaintext polynomials as unsigned integers
    that represent them modulo the plaintext modulus. Thus, for example, a coefficient of -1
    would be stored as a polynomial coefficient plain_modulus-1.

    @par Decoding Overflow
    In many cases it is a bad idea to throw an exception when decoding fails due to an overflow
    condition, e.g. decode is given a polynomial whose integer part decodes into a value larger 
    than 64 bits. If such an exception is not handled silently, a malicious observer might notice
    this happening, and be able to extract one bit of information about the secret key.
    Thus, by default, the decoder functions do not throw exceptions in cases of overflow.
    However, the throws are automatically enabled in debug mode in Visual Studio, and more
    generally they can be directly controlled by the preprocessor define SEAL_THROW_ON_DECODER_OVERFLOW
    in the file util/defines.h.

    @see BinaryEncoder for encoding integers.
    @see BalancedFractionalEncoder for encoding using base-b representation for b greater than 2.
    @see FractionalEncoder for a common interface to all fractional encoders.

</member>
<member name="M:seal.BinaryFractionalEncoder.#ctor(seal.SmallModulus!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,seal.BigPoly!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Int32,System.Int32)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="685">
        Creates a new BinaryFractionalEncoder object. The constructor takes as input a reference
        to the plaintext modulus, a reference to the polynomial modulus,
        and the numbers of coefficients that are reserved for the integral and fractional parts.
        The coefficients for the integral part are counted starting from the low-degree end
        of the polynomial, and the coefficients for the fractional part are counted from the
        high-degree end.

        @param[in] plain_modulus The plaintext modulus (represented by SmallModulus)
        @param[in] poly_modulus The polynomial modulus (represented by BigPoly)
        @param[in] integer_coeff_count The number of polynomial coefficients reserved for the integral part
        @param[in] fraction_coeff_count The number of polynomial coefficients reserved for the fractional part
        @throws std::invalid_argument if plain_modulus is not at least 2
        @throws std::invalid_argument if integer_coeff_count is not strictly positive
        @throws std::invalid_argument if fraction_coeff_count is not strictly positive
        @throws std::invalid_argument if poly_modulus is zero
        @throws std::invalid_argument if poly_modulus is too small for the integral and fractional parts

</member>
<member name="M:seal.BinaryFractionalEncoder.Dispose" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="706">
        Creates a copy of a BinaryFractionalEncoder.

        @param[in] copy The BinaryFractionalEncoder to copy from

        Creates a new BinaryFractionalEncoder by moving an old one.

        @param[in] source The BinaryFractionalEncoder to move from

Destroys the BinaryFractionalEncoder.

</member>
<member name="M:seal.BinaryFractionalEncoder.encode(System.Double)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="727">
        Encodes a double precision floating point number into a plaintext polynomial.

        @param[in] value The double-precision floating-point number to encode

</member>
<member name="M:seal.BinaryFractionalEncoder.decode(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="734">
        Decodes a plaintext polynomial and returns the result as a double-precision
        floating-point number.

        @param[in] plain The plaintext to be decoded
        @throws std::invalid_argument if plain does not represent a valid plaintext polynomial
        @throws std::invalid_argument if the integral part does not fit in std::int64_t (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)

</member>
<member name="M:seal.BinaryFractionalEncoder.plain_modulus" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="744">
Returns a reference to the plaintext modulus.

</member>
<member name="M:seal.BinaryFractionalEncoder.poly_modulus" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="752">
Returns a reference to the polynomial modulus.

</member>
<member name="M:seal.BinaryFractionalEncoder.base" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="760">
Returns the base used for encoding (2).

</member>
<member name="M:seal.BinaryFractionalEncoder.fraction_coeff_count" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="768">
Returns the number of coefficients reserved for the fractional part.

</member>
<member name="M:seal.BinaryFractionalEncoder.integer_coeff_count" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="776">
Returns the number of coefficients reserved for the integral part.

</member>
<member name="T:seal.BalancedFractionalEncoder" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="800">
    Encodes floating point numbers into plaintext polynomials that Encryptor can encrypt.
    An instance of the BalancedFractionalEncoder class converts a double-precision floating-point
    number into a plaintext polynomial by computing its balanced base-b representation, encoding the
    integral part as in BalancedEncoder, and the fractional part as the highest degree
    terms of the plaintext polynomial, with signs inverted. For an even base b, the
    coefficients of the polynomial are in the range -b/2,...,b/2-1. Decoding the polynomial back
    into a double amounts to evaluating the low degree part at X=b, negating the coefficients
    of the high degree part and evaluating it at X=1/b.

    Addition and multiplication on the double side translate into addition and multiplication
    on the encoded plaintext polynomial side, provided that the integral part never mixes
    with the fractional part in the plaintext polynomials, and that the
    coefficients of the plaintext polynomials appearing throughout the computations never
    experience coefficients larger than the plaintext modulus (plain_modulus).

    @par Integral and Fractional Parts
    When homomorphic multiplications are performed, the integral part "grows up" to higher
    degree coefficients of the plaintext polynomial space, and the fractional part "grows down"
    from the top degree coefficients towards the lower degree coefficients. For decoding to work,
    these parts must not interfere with each other. When setting up the BalancedFractionalEncoder,
    one must specify how many coefficients of a plaintext polynomial are reserved for the integral
    part and how many for the fractional. The sum of these numbers can be at most equal to the
    degree of the polynomial modulus minus one. If homomorphic multiplications are performed, it is
    also necessary to leave enough room for the fractional part to "grow down".

    @par Negative Integers
    Negative integers in the balanced base-b encoding are represented the same way as
    positive integers, namely, both positive and negative integers can have both positive and negative
    digits in their balanced base-b representation. Negative coefficients are stored in the
    plaintext polynomials as unsigned integers that represent them modulo the plaintext modulus.
    Thus, for example, a coefficient of -1 would be stored as a polynomial coefficient plain_modulus-1.

    @par Decoding Overflow
    In many cases it is a bad idea to throw an exception when decoding fails due to an overflow
    condition, e.g. decode is given a polynomial whose integer part decodes into a value larger than
    64 bits. If such an exception is not handled silently, a malicious observer might notice
    this happening, and be able to extract one bit of information about the secret key.
    Thus, by default, the decoder functions do not throw exceptions in cases of overflow.
    However, the throws are automatically enabled in debug mode in Visual Studio, and more
    generally they can be directly controlled by the preprocessor define SEAL_THROW_ON_DECODER_OVERFLOW
    in the file util/defines.h.

    @see BalancedEncoder for encoding integers.
    @see BinaryFractionalEncoder for encoding using the binary representation.
    @see FractionalEncoder for a common interface to all fractional encoders.

</member>
<member name="M:seal.BalancedFractionalEncoder.#ctor(seal.SmallModulus!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,seal.BigPoly!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Int32,System.Int32,System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="850">
        Creates a new BalancedFractionalEncoder object. The constructor takes as input a reference
        to the plaintext modulus, a reference to the polynomial modulus,
        and the numbers of coefficients that are reserved for the integral and fractional parts,
        and optionally an integer, at least 3, that is used as the base in the encoding.
        The coefficients for the integral part are counted starting from the low-degree end
        of the polynomial, and the coefficients for the fractional part are counted from the
        high-degree end.

        @param[in] plain_modulus The plaintext modulus (represented by SmallModulus)
        @param[in] poly_modulus The polynomial modulus (represented by BigPoly)
        @param[in] integer_coeff_count The number of polynomial coefficients reserved for the integral part
        @param[in] fraction_coeff_count The number of polynomial coefficients reserved for the fractional part
        @param[in] base The base to be used for encoding (default value is 3)
        @throws std::invalid_argument if plain_modulus is not at least base
        @throws std::invalid_argument if integer_coeff_count is not strictly positive
        @throws std::invalid_argument if fraction_coeff_count is not strictly positive
        @throws std::invalid_argument if poly_modulus is zero
        @throws std::invalid_argument if poly_modulus is too small for the integral and fractional parts
        @throws std::invalid_argument if base is not an integer and at least 3

</member>
<member name="M:seal.BalancedFractionalEncoder.Dispose" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="874">
        Creates a copy of a BalancedFractionalEncoder.

        @param[in] copy The BalancedFractionalEncoder to copy from

        Creates a new BalancedFractionalEncoder by moving an old one.

        @param[in] source The BalancedFractionalEncoder to move from

Destroys the BalancedFractionalEncoder.

</member>
<member name="M:seal.BalancedFractionalEncoder.encode(System.Double)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="895">
        Encodes a double precision floating point number into a plaintext polynomial.

        @param[in] value The double-precision floating-point number to encode

</member>
<member name="M:seal.BalancedFractionalEncoder.decode(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="902">
        Decodes a plaintext polynomial and returns the result as a double-precision
        floating-point number.

        @param[in] plain The plaintext to be decoded
        @throws std::invalid_argument if plain does not represent a valid plaintext polynomial
        @throws std::invalid_argument if the integral part does not fit in std::int64_t (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)

</member>
<member name="M:seal.BalancedFractionalEncoder.plain_modulus" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="912">
Returns a reference to the plaintext modulus.

</member>
<member name="M:seal.BalancedFractionalEncoder.poly_modulus" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="920">
Returns a reference to the polynomial modulus.

</member>
<member name="M:seal.BalancedFractionalEncoder.base" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="928">
Returns the base used for encoding.

</member>
<member name="M:seal.BalancedFractionalEncoder.fraction_coeff_count" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="936">
Returns the number of coefficients reserved for the fractional part.

</member>
<member name="M:seal.BalancedFractionalEncoder.integer_coeff_count" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="944">
Returns the number of coefficients reserved for the integral part.

</member>
<member name="T:seal.IntegerEncoder" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="972">
    Encodes integers into plaintext polynomials that Encryptor can encrypt. An instance of
    the IntegerEncoder class converts an integer into a plaintext polynomial by placing its
    digits in balanced base-b representation as the coefficients of the polynomial. The base
    b must be a positive integer at least 2 (which is the default value). When b is odd,
    digits in such a balanced representation are integers in the range -(b-1)/2,...,(b-1)/2.
    When b is even, digits are integers in the range -b/2,...,b/2-1. When b is 2, the 
    coefficients are either all non-negative (0 and 1), or all non-positive (0 and -1). A larger 
    base allows for more compact representation at the cost of having larger coefficients in 
    freshly encoded plaintext polynomials. Decoding the integer amounts to evaluating the 
    plaintext polynomial at X=b.

    Addition and multiplication on the integer side translate into addition and multiplication
    on the encoded plaintext polynomial side, provided that the length of the polynomial
    never grows to be of the size of the polynomial modulus (poly_modulus), and that the
    coefficients of the plaintext polynomials appearing throughout the computations never
    experience coefficients larger than the plaintext modulus (plain_modulus).

    @par Negative Integers
    Negative integers in the base-b encoding are represented the same way as positive integers, 
    namely, both positive and negative integers can have both positive and negative digits in their 
    base-b representation. Negative coefficients are stored in the plaintext polynomials as unsigned 
    integers that represent them modulo the plaintext modulus. Thus, for example, a coefficient of -1 
    would be stored as a polynomial coefficient plain_modulus-1.

    @par Decoding Overflow
    In many cases it is a bad idea to throw an exception when decoding fails due to an overflow
    condition, e.g. decode_uint32 is given a polynomial that decodes into a value larger than
    32 bits. If such an exception is not handled silently, a malicious observer might notice
    this happening, and be able to extract one bit of information about the secret key.
    Thus, by default, the decoder functions do not throw exceptions in cases of overflow.
    However, the throws are automatically enabled in debug mode in Visual Studio, and more
    generally they can be directly controlled by the preprocessor define SEAL_THROW_ON_DECODER_OVERFLOW
    in the file util/defines.h.

    @par BinaryEncoder and BalancedEncoder
    Under the hood IntegerEncoder uses either the BinaryEncoder or the BalancedEncoder classes
    to do the encoding. The first one is used when the base is 2, and the second one when the
    base is at least 3. Currently the BinaryEncoder and BalancedEncoder classes can also be used 
    directly, but this might change in future releases.

    @see BinaryEncoder for encoding using the binary representation.
    @see BalancedEncoder for encoding using base-b representation for b greater than 2.
    @see FractionalEncoder for encoding real numbers.

</member>
<member name="M:seal.IntegerEncoder.#ctor(seal.SmallModulus!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1020">
        Creates an IntegerEncoder object. The constructor takes as input a reference
        to the plaintext modulus (represented by SmallModulus), and optionally an integer,
        at least 2, that is used as a base in the encoding.

        @param[in] plain_modulus The plaintext modulus (represented by SmallModulus)
        @param[in] base The base to be used for encoding (default value is 2)
        @throws std::invalid_argument if base is not an integer and at least 2
        @throws std::invalid_argument if plain_modulus is not at least base

</member>
<member name="M:seal.IntegerEncoder.#ctor(seal.IntegerEncoder!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1032">
        Creates a copy of a IntegerEncoder.

        @param[in] copy The IntegerEncoder to copy from

</member>
<member name="M:seal.IntegerEncoder.Dispose" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1039">
        Creates a new IntegerEncoder by moving an old one.

        @param[in] source The IntegerEncoder to move from

Destroys the IntegerEncoder.

</member>
<member name="M:seal.IntegerEncoder.encode(System.UInt64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1051">
        Encodes an unsigned integer (represented by std::uint64_t) into a plaintext polynomial.

        @param[in] value The unsigned integer to encode

</member>
<member name="M:seal.IntegerEncoder.encode(System.UInt64,seal.Plaintext*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1061">
        Encodes an unsigned integer (represented by std::uint64_t) into a plaintext polynomial.

        @param[in] value The unsigned integer to encode
        @param[out] destination The plaintext to overwrite with the encoding

</member>
<member name="M:seal.IntegerEncoder.decode_uint32(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1069">
        Decodes a plaintext polynomial and returns the result as std::uint32_t.
        Mathematically this amounts to evaluating the input polynomial at X=base.

        @param[in] plain The plaintext to be decoded
        @throws std::invalid_argument if plain does not represent a valid plaintext polynomial
        @throws std::invalid_argument if the output does not fit in std::uint32_t (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)

</member>
<member name="M:seal.IntegerEncoder.decode_uint64(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1082">
        Decodes a plaintext polynomial and returns the result as std::uint64_t.
        Mathematically this amounts to evaluating the input polynomial at X=base.

        @param[in] plain The plaintext to be decoded
        @throws std::invalid_argument if plain does not represent a valid plaintext polynomial
        @throws std::invalid_argument if the output does not fit in std::uint64_t (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)

</member>
<member name="M:seal.IntegerEncoder.encode(System.Int64)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1095">
        Encodes a signed integer (represented by std::int64_t) into a plaintext polynomial.

        @par Negative Integers
        Negative integers in the base-b encoding are represented the same way as positive integers,
        namely, both positive and negative integers can have both positive and negative digits in their
        base-b representation. Negative coefficients are stored in the plaintext polynomials as unsigned
        integers that represent them modulo the plaintext modulus. Thus, for example, a coefficient of -1
        would be stored as a polynomial coefficient plain_modulus-1.

        @param[in] value The signed integer to encode

</member>
<member name="M:seal.IntegerEncoder.encode(System.Int64,seal.Plaintext*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1112">
        Encodes a signed integer (represented by std::int64_t) into a plaintext polynomial.

        @par Negative Integers
        Negative integers in the base-b encoding are represented the same way as positive integers,
        namely, both positive and negative integers can have both positive and negative digits in their
        base-b representation. Negative coefficients are stored in the plaintext polynomials as unsigned
        integers that represent them modulo the plaintext modulus. Thus, for example, a coefficient of -1
        would be stored as a polynomial coefficient plain_modulus-1.

        @param[in] value The signed integer to encode
        @param[out] destination The plaintext to overwrite with the encoding

</member>
<member name="M:seal.IntegerEncoder.encode(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1127">
        Encodes an unsigned integer (represented by BigUInt) into a plaintext polynomial.

        @param[in] value The unsigned integer to encode

</member>
<member name="M:seal.IntegerEncoder.encode(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,seal.Plaintext*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1137">
        Encodes an unsigned integer (represented by BigUInt) into a plaintext polynomial.

        @param[in] value The unsigned integer to encode
        @param[out] destination The plaintext to overwrite with the encoding

</member>
<member name="M:seal.IntegerEncoder.decode_int32(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1145">
        Decodes a plaintext polynomial and returns the result as std::int32_t.
        Mathematically this amounts to evaluating the input polynomial at X=base.

        @param[in] plain The plaintext to be decoded
        @throws std::invalid_argument if plain does not represent a valid plaintext polynomial
        @throws std::invalid_argument if the output does not fit in std::int32_t (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)

</member>
<member name="M:seal.IntegerEncoder.decode_int64(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1158">
        Decodes a plaintext polynomial and returns the result as std::int64_t.
        Mathematically this amounts to evaluating the input polynomial at X=base.

        @param[in] plain The plaintext to be decoded
        @throws std::invalid_argument if plain does not represent a valid plaintext polynomial
        @throws std::invalid_argument if the output does not fit in std::int64_t (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)

</member>
<member name="M:seal.IntegerEncoder.decode_biguint(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1171">
        Decodes a plaintext polynomial and returns the result as BigUInt.
        Mathematically this amounts to evaluating the input polynomial at X=base.

        @param[in] plain The plaintext to be decoded
        @throws std::invalid_argument if plain does not represent a valid plaintext polynomial
        @throws std::invalid_argument if the output is negative (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)

</member>
<member name="M:seal.IntegerEncoder.decode_biguint(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,seal.BigUInt*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1184">
        Decodes a plaintext polynomial and stores the result in a given BigUInt.
        Mathematically this amounts to evaluating the input polynomial at X=base.

        @param[in] plain The plaintext to be decoded
        @param[out] destination The BigUInt to overwrite with the decoding
        @throws std::invalid_argument if plain does not represent a valid plaintext polynomial
        @throws std::invalid_argument if the output does not fit in destination
        @throws std::invalid_argument if the output is negative (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)

</member>
<member name="M:seal.IntegerEncoder.encode(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1199">
        Encodes a signed integer (represented by std::int32_t) into a plaintext polynomial.

        @par Negative Integers
        Negative integers in the base-b encoding are represented the same way as positive integers,
        namely, both positive and negative integers can have both positive and negative digits in their
        base-b representation. Negative coefficients are stored in the plaintext polynomials as unsigned
        integers that represent them modulo the plaintext modulus. Thus, for example, a coefficient of -1
        would be stored as a polynomial coefficient plain_modulus-1.

        @param[in] value The signed integer to encode

</member>
<member name="M:seal.IntegerEncoder.encode(System.UInt32)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1216">
        Encodes an unsigned integer (represented by std::uint32_t) into a plaintext polynomial.

        @param[in] value The unsigned integer to encode

</member>
<member name="M:seal.IntegerEncoder.encode(System.Int32,seal.Plaintext*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1226">
        Encodes a signed integer (represented by std::int32_t) into a plaintext polynomial.

        @par Negative Integers
        Negative integers in the base-b encoding are represented the same way as positive integers,
        namely, both positive and negative integers can have both positive and negative digits in their
        base-b representation. Negative coefficients are stored in the plaintext polynomials as unsigned
        integers that represent them modulo the plaintext modulus. Thus, for example, a coefficient of -1
        would be stored as a polynomial coefficient plain_modulus-1.

        @param[in] value The signed integer to encode
        @param[out] destination The plaintext to overwrite with the encoding

</member>
<member name="M:seal.IntegerEncoder.encode(System.UInt32,seal.Plaintext*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1241">
        Encodes an unsigned integer (represented by std::uint32_t) into a plaintext polynomial.

        @param[in] value The unsigned integer to encode
        @param[out] destination The plaintext to overwrite with the encoding

</member>
<member name="M:seal.IntegerEncoder.plain_modulus" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1249">
Returns a reference to the plaintext modulus.

</member>
<member name="M:seal.IntegerEncoder.base" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1257">
Returns the base used for encoding.

</member>
<member name="T:seal.FractionalEncoder" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1273">
    Encodes floating point numbers into plaintext polynomials that Encryptor can encrypt.
    An instance of the FractionalEncoder class converts a double-precision floating-point
    number into a plaintext polynomial by computing its balanced base-b representation, 
    encoding the integral part as in IntegerEncoder, and the fractional part as the highest 
    degree terms of the plaintext polynomial, with signs inverted. For an even base b, the
    coefficients of the polynomial are in the range -b/2,...,b/2-1. When b is 2, the
    coefficients are either all non-negative (0 and 1), or all non-positive (0 and -1).
    Decoding the polynomial back into a double amounts to evaluating the low degree part 
    at X=b, negating the coefficients of the high degree part and evaluating it at X=1/b.

    Addition and multiplication on the double side translate into addition and multiplication
    on the encoded plaintext polynomial side, provided that the integral part never mixes
    with the fractional part in the plaintext polynomials, and that the
    coefficients of the plaintext polynomials appearing throughout the computations never
    experience coefficients larger than the plaintext modulus (plain_modulus).

    @par Integral and Fractional Parts
    When homomorphic multiplications are performed, the integral part "grows up" to higher
    degree coefficients of the plaintext polynomial space, and the fractional part "grows down"
    from the top degree coefficients towards the lower degree coefficients. For decoding to work,
    these parts must not interfere with each other. When setting up the BalancedFractionalEncoder,
    one must specify how many coefficients of a plaintext polynomial are reserved for the integral
    part and how many for the fractional. The sum of these numbers can be at most equal to the
    degree of the polynomial modulus minus one. If homomorphic multiplications are performed, it is
    also necessary to leave enough room for the fractional part to "grow down".

    @par Negative Integers
    Negative integers in the base-b encoding are represented the same way as positive integers,
    namely, both positive and negative integers can have both positive and negative digits in their
    base-b representation. Negative coefficients are stored in the plaintext polynomials as unsigned
    integers that represent them modulo the plaintext modulus. Thus, for example, a coefficient of -1
    would be stored as a polynomial coefficient plain_modulus-1.

    @par Decoding Overflow
    In many cases it is a bad idea to throw an exception when decoding fails due to an overflow
    condition, e.g. decode is given a polynomial whose integer part decodes into a value larger than 64 bits.
    If such an exception is not handled silently, a malicious observer might notice
    this happening, and be able to extract one bit of information about the secret key.
    Thus, by default, the decoder functions do not throw exceptions in cases of overflow.
    However, the throws are automatically enabled in debug mode in Visual Studio, and more
    generally they can be directly controlled by the preprocessor define SEAL_THROW_ON_DECODER_OVERFLOW
    in the file util/defines.h.

    @par BinaryFractionalEncoder and BalancedFractionalEncoder
    Under the hood FractionalEncoder uses either the BinaryFractionalEncoder or the 
    BalancedFractionalEncoder classes to do the encoding. The first one is used when the base is 2, 
    and the second one when the base is at least 3. Currently the BinaryFractionalEncoder and 
    BalancedFractionalEncoder classes can also be used directly, but this might change in future releases.

    @see BinaryFractionalEncoder for encoding using the binary representation.
    @see BalancedFractionalEncoder for encoding using base-b representation for b greater than 2.
    @see IntegerEncoder for encoding integers.

</member>
<member name="M:seal.FractionalEncoder.#ctor(seal.SmallModulus!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,seal.BigPoly!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Int32,System.Int32,System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1330">
        Creates a new FractionalEncoder object. The constructor takes as input a reference
        to the plaintext modulus, a reference to the polynomial modulus,
        and the numbers of coefficients that are reserved for the integral and fractional parts,
        and optionally an integer, at least 2, that is used as the base in the encoding.
        The coefficients for the integral part are counted starting from the low-degree end
        of the polynomial, and the coefficients for the fractional part are counted from the
        high-degree end.

        @param[in] plain_modulus The plaintext modulus (represented by SmallModulus)
        @param[in] poly_modulus The polynomial modulus (represented by BigPoly)
        @param[in] integer_coeff_count The number of polynomial coefficients reserved for the integral part
        @param[in] fraction_coeff_count The number of polynomial coefficients reserved for the fractional part
        @param[in] base The base to be used for encoding (default value is 2)
        @throws std::invalid_argument if plain_modulus is not at least base
        @throws std::invalid_argument if integer_coeff_count is not strictly positive
        @throws std::invalid_argument if fraction_coeff_count is not strictly positive
        @throws std::invalid_argument if poly_modulus is zero
        @throws std::invalid_argument if poly_modulus is too small for the integral and fractional parts
        @throws std::invalid_argument if base is not an integer and at least 2

</member>
<member name="M:seal.FractionalEncoder.#ctor(seal.FractionalEncoder!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1354">
        Creates a copy of a FractionalEncoder.

        @param[in] copy The FractionalEncoder to copy from

</member>
<member name="M:seal.FractionalEncoder.Dispose" decl="true" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1361">
        Creates a new FractionalEncoder by moving an old one.

        @param[in] source The FractionalEncoder to move from

Destroys the FractionalEncoder.

</member>
<member name="M:seal.FractionalEncoder.encode(System.Double)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1373">
        Encodes a double precision floating point number into a plaintext polynomial.

        @param[in] value The double-precision floating-point number to encode

</member>
<member name="M:seal.FractionalEncoder.decode(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1383">
        Decodes a plaintext polynomial and returns the result as a double-precision
        floating-point number.

        @param[in] plain The plaintext to be decoded
        @throws std::invalid_argument if plain does not represent a valid plaintext polynomial
        @throws std::invalid_argument if the integral part does not fit in std::int64_t (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)

</member>
<member name="M:seal.FractionalEncoder.plain_modulus" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1396">
Returns a reference to the plaintext modulus.

</member>
<member name="M:seal.FractionalEncoder.poly_modulus" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1404">
Returns a reference to the polynomial modulus.

</member>
<member name="M:seal.FractionalEncoder.base" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1412">
Returns the base used for encoding.

</member>
<member name="M:seal.FractionalEncoder.fraction_coeff_count" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1420">
Returns the number of coefficients reserved for the fractional part.

</member>
<member name="M:seal.FractionalEncoder.integer_coeff_count" decl="false" source="c:\hackaton\seal_2.3.1\seal\seal\encoder.h" line="1428">
Returns the number of coefficients reserved for the integral part.

</member>
<!-- Discarding badly formed XML document comment for member 'T:Microsoft.Research.SEAL.SmallModulus'. -->
<member name="M:Microsoft.Research.SEAL.SmallModulus.#ctor" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\smallmoduluswrapper.h" line="38">
                <summary>Creates a SmallModulus instance.</summary>

                <remarks>
                Creates a SmallModulus instance. The value of the SmallModulus is set to 0.
                </remarks>

</member>
<member name="M:Microsoft.Research.SEAL.SmallModulus.#ctor(System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\smallmoduluswrapper.h" line="47">
                <summary>Creates a SmallModulus instance.</summary>

                <remarks>
                Creates a SmallModulus instance. The value of the SmallModulus is set to
                the given value.
                </remarks>
                <param name="value">The integer modulus</param>
                <exception cref="T:System.ArgumentException">if value is 1 or more than
                62 bits</exception>

</member>
<member name="M:Microsoft.Research.SEAL.SmallModulus.#ctor(Microsoft.Research.SEAL.SmallModulus)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\smallmoduluswrapper.h" line="60">
                <summary>Creates a new SmallModulus by copying a given one.</summary>

                <param name="copy">The SmallModulus to copy from</param>
                <exception cref="T:System.ArgumentNullException">if copy is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.SmallModulus.Set(Microsoft.Research.SEAL.SmallModulus)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\smallmoduluswrapper.h" line="68">
                <summary>Copies a given SmallModulus to the current one.</summary>

                <param name="assign">The SmallModulus to copy from</param>
                <exception cref="T:System.ArgumentNullException">if assign is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.SmallModulus.Set(System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\smallmoduluswrapper.h" line="76">
                <summary>Sets the value of the SmallModulus.</summary>

                <param name="value">The new integer modulus</param>
                <exception cref="T:System.ArgumentException">if value is 1 or more than 
                62 bits</exception>

</member>
<member name="P:Microsoft.Research.SEAL.SmallModulus.BitCount" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\smallmoduluswrapper.h" line="85">
<summary>Returns the significant bit count of the value of the current 
SmallModulus.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.SmallModulus.UInt64Count" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\smallmoduluswrapper.h" line="93">
<summary>Returns the size (in 64-bit words) of the value of the current 
SmallModulus.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.SmallModulus.Value" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\smallmoduluswrapper.h" line="101">
<summary>Returns the value of the current SmallModulus.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.SmallModulus.ConstRatio" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\smallmoduluswrapper.h" line="108">
                <summary>Returns the Barrett ratio computed for the value of the current 
                SmallModulus.</summary>

                <remarks>
                Returns the Barrett ratio computed for the value of the current SmallModulus.
                The first two components of the Barrett ratio are the floor of 2^128/value,
                and the third component is the remainder.
                </remarks>

</member>
<member name="P:Microsoft.Research.SEAL.SmallModulus.IsZero" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\smallmoduluswrapper.h" line="122">
<summary>Returns whether the value of the current SmallModulus is zero.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.SmallModulus.Save(System.IO.Stream)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\smallmoduluswrapper.h" line="129">
                <summary>Saves the SmallModulus to an output stream.</summary>

                <remarks>
                Saves the SmallModulus to an output stream. The output is in binary format and 
                not human-readable. The output stream must have the "binary" flag set.
                </remarks>

                <param name="stream">The stream to save the SmallModulus to</param>
                <exception cref="T:System.ArgumentNullException">if stream is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.SmallModulus.Load(System.IO.Stream)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\smallmoduluswrapper.h" line="142">
                <summary>Loads a SmallModulus from an input stream overwriting the current 
                SmallModulus.</summary>

                <param name="stream">The stream to load the SmallModulus from</param>
                <exception cref="T:System.ArgumentNullException">if stream is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.SmallModulus.GetHashCode" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\smallmoduluswrapper.h" line="151">
<summary>Returns a hash-code based on the value of the SmallModulus.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.SmallModulus.Equals(Microsoft.Research.SEAL.SmallModulus)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\smallmoduluswrapper.h" line="156">
                <summary>Compares two SmallModulus instances.</summary>

                <param name="compare">The value to compare against</param>
                <exception cref="T:System.ArgumentNullException">If compare is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.SmallModulus.Equals(System.Object)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\smallmoduluswrapper.h" line="164">
                <summary>Compares two SmallModulus instances.</summary>

                <param name="compare">The value to compare against</param>
                <exception cref="T:System.ArgumentNullException">If compare is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.SmallModulus.Equals(System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\smallmoduluswrapper.h" line="172">
                <summary>Compares value of the current SmallModulus to a given value.</summary>

                <param name="compare">The value to compare against</param>

</member>
<member name="M:Microsoft.Research.SEAL.SmallModulus.Dispose" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\smallmoduluswrapper.h" line="179">
<summary>Destroys the SmallModulus.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.SmallModulus.Finalize" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\smallmoduluswrapper.h" line="184">
<summary>Destroys the SmallModulus.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.SmallModulus.op_Implicit(System.UInt64)~Microsoft.Research.SEAL.SmallModulus" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\smallmoduluswrapper.h" line="189">
                <summary>Creates a SmallModulus instance.</summary>

                <remarks>
                Creates a SmallModulus instance. The value of the SmallModulus is set to
                the given value.
                </remarks>
                <param name="value">The integer modulus</param>
                <exception cref="T:System.ArgumentException">if value is 1 or more than
                62 bits</exception>

</member>
<member name="M:Microsoft.Research.SEAL.SmallModulus.#ctor(seal.SmallModulus!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\smallmoduluswrapper.h" line="203">
<summary>Creates a deep copy of a C++ SmallModulus instance.</summary>
<param name="value">The SmallModulus instance to copy from</param>
<exception cref="T:System.ArgumentNullException">If copy is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.SmallModulus.GetModulus" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\smallmoduluswrapper.h" line="210">
<summary>Returns a reference to the underlying C++ SecretKey.</summary>

</member>
<member name="T:Microsoft.Research.SEAL.BigUInt" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="13">
            <summary>Represents an unsigned integer with a specified bit width.</summary>
            <remarks>
            <para>
            Represents an unsigned integer with a specified bit width. BigUInts are mutable and able to be resized. 
            The bit count for a BigUInt (which can be read with <see cref="P:Microsoft.Research.SEAL.BigUInt.BitCount"/>) is set initially by the 
            constructor and can be resized either explicitly with the <see cref="M:Microsoft.Research.SEAL.BigUInt.Resize(System.Int32)"/> function or implicitly
            with an assignment operation (e.g., one of the Set() functions). A rich set of unsigned integer operations 
            are provided by the BigUInt class, including comparison, traditional arithmetic (addition, subtraction, 
            multiplication, division), and modular arithmetic functions.
            </para>

            <para>
            The backing array for a BigUInt stores its unsigned integer value as a contiguous System::UInt64 array.
            Each System::UInt64 in the array sequentially represents 64-bits of the integer value, with the least
            significant quad-word storing the lower 64-bits and the order of the bits for each quad word dependent 
            on the architecture's System::UInt64 representation. The size of the array equals the bit count of the 
            BigUInt (which can be read with <see cref="P:Microsoft.Research.SEAL.BigUInt.BitCount"/>) rounded up to the next System::UInt64 boundary 
            (i.e., rounded up to the next 64-bit boundary). The <see cref="P:Microsoft.Research.SEAL.BigUInt.UInt64Count"/> property returns the number
            of System::UInt64 in the backing array. The <see cref="P:Microsoft.Research.SEAL.BigUInt.Pointer"/> property returns a pointer to the first
            System::UInt64 in the array. Additionally, the index property allows accessing the individual bytes of
            the integer value in a platform-independent way - for example, reading the third byte will always return 
            bits 16-24 of the BigUInt value regardless of the platform being little-endian or big-endian.
            </para>

            <para>
            Both the copy constructor and the Set function allocate more memory for the backing array when needed, 
            i.e. when the source BigUInt has a larger backing array than the destination. Conversely, when the destination
            backing array is already large enough, the data is only copied and the unnecessary higher order bits are set
            to zero. When new memory has to be allocated, only the significant bits of the source BigUInt are taken into 
            account. This is is important, because it avoids unnecessary zero bits to be included in the destination,
            which in some cases could accumulate and result in very large unnecessary allocations. However, sometimes 
            it is necessary to preserve the original size, even if some of the leading bits are zero. For this purpose 
            BigUInt contains functions <see cref="M:Microsoft.Research.SEAL.BigUInt.DuplicateFrom(Microsoft.Research.SEAL.BigUInt)"/> and <see cref="M:Microsoft.Research.SEAL.BigUInt.DuplicateTo(Microsoft.Research.SEAL.BigUInt)"/>, which create an exact 
            copy of the source BigUInt.
            </para>

            <para>
            An aliased BigUInt (which can be determined with <see cref="P:Microsoft.Research.SEAL.BigUInt.IsAlias"/>) is a special type of BigUInt that 
            does not manage its underlying System::UInt64 pointer used to store the value. An aliased BigUInt supports
            most of the same operations as a non-aliased BigUInt, including reading and writing the value, however 
            an aliased BigUInt does not internally allocate or deallocate its backing array and, therefore, does not 
            support resizing. Any attempt, either explicitly or implicitly, to resize the BigUInt will result in an 
            exception being thrown. Aliased BigUInt's are only created internally. Aliasing is useful in cases where 
            it is desirable to not have each BigUInt manage its own memory allocation and/or to prevent unnecessary 
            copying. For example, <see cref="T:Microsoft.Research.SEAL.BigPoly"/> uses aliased BigUInt's to return BigUInt representations of 
            its coefficients, where the aliasing allows read/writes to the BigUInt to refer directly to the coefficient's 
            corresponding region in the backing array of the <see cref="T:Microsoft.Research.SEAL.BigPoly"/>.
            </para>

            <para>
            In general, reading a BigUInt is thread-safe while mutating is not. Specifically, the backing array may be 
            freed whenever a resize occurs or the BigUInt is destroyed, which would invalidate the address returned by
            <see cref="P:Microsoft.Research.SEAL.BigUInt.Pointer"/>. When it is known that a resize will not occur, concurrent reading and mutating will 
            not inherently fail but it is possible for a read to see a partially updated value from a concurrent write.
            A non-aliased BigUInt allocates its backing array from the global (thread-safe) memory pool. Consequently, 
            creating or resizing a large number of BigUInt can result in a performance loss due to thread contention.
            </para>
            </remarks>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.#ctor" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="76">
<summary>Creates an empty BigUInt with zero bit width.</summary>
<remarks>
Creates an empty BigUInt with zero bit width. No memory is allocated by this constructor.
</remarks>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.#ctor(System.Int32)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="84">
                <summary>Creates a zero-initialized BigUInt of the specified bit width.</summary>

                <param name="bitCount">The bit width</param>
                <exception cref="T:System.ArgumentException">if bitCount is negative</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.#ctor(System.Int32,System.String)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="92">
                <summary>Creates a BigUInt of the specified bit width and initializes it with the unsigned hexadecimal 
                integer specified by the string.</summary>
                <remarks>
                Creates a BigUInt of the specified bit width and initializes it with the unsigned hexadecimal integer 
                specified by the string. The string must match the format returned by <see cref="M:Microsoft.Research.SEAL.BigUInt.ToString"/> and must 
                consist of only the characters 0-9, A-F, or a-f, most-significant nibble first.
                </remarks>

                <param name="bitCount">The bit width</param>
                <param name="hexString">The hexadecimal integer string specifying the initial value</param>
                <exception cref="T:System.ArgumentNullException">If hexString is null</exception>
                <exception cref="T:System.ArgumentException">if bitCount is negative</exception>
                <exception cref="T:System.ArgumentException">If hexString does not adhere to the expected format</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.#ctor(System.Int32,System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="109">
                <summary>Creates a BigUInt of the specified bit width and initializes it to the specified unsigned integer
                value.</summary>

                <param name="bitCount">The bit width</param>
                <param name="value">The initial value to set the BigUInt</param>
                <exception cref="T:System.ArgumentException">if bitCount is negative</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.#ctor(System.String)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="119">
                <summary>Creates a BigUInt initialized and minimally sized to fit the unsigned hexadecimal integer specified 
                by the string.</summary>

                <remarks>
                Creates a BigUInt initialized and minimally sized to fit the unsigned hexadecimal integer specified by 
                the string. The string matches the format returned by <see cref="M:Microsoft.Research.SEAL.BigUInt.ToString"/> and must consist of only 
                the characters 0-9, A-F, or a-f, most-significant nibble first.
                </remarks>

                <param name="hexString">The hexadecimal integer string specifying the initial value</param>
                <exception cref="T:System.ArgumentNullException">If hexString is null</exception>
                <exception cref="T:System.ArgumentException">If hexString does not adhere to the expected format</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.#ctor(System.ValueType!System.Numerics.BigInteger!System.Runtime.CompilerServices.IsBoxed)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="135">
<summary>Creates a BigUInt initialized and minimally sized to fit the unsigned hexadecimal integer specified 
by the <see cref="T:System.Numerics.BigInteger"/>.</summary>

<param name="bigInteger">The initial value of the BigUInt</param>
<exception cref="T:System.ArgumentNullException">If bigInteger is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.#ctor(Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="144">
                <summary>Creates a deep copy of a BigUInt.</summary>
                <remarks>
                Creates a deep copy of a BigUInt. The created BigUInt will have the same bit count and value as the original.
                </remarks>

                <param name="copy">The BigUInt to copy from</param>
                <exception cref="T:System.ArgumentNullException">If copy is null</exception>

</member>
<member name="P:Microsoft.Research.SEAL.BigUInt.IsAlias" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="155">
                <summary>Returns whether or not the BigUInt is an alias.</summary>

                <seealso cref="T:Microsoft.Research.SEAL.BigUInt">See BigUInt for a detailed description of aliased BigUInt.</seealso>

</member>
<member name="P:Microsoft.Research.SEAL.BigUInt.BitCount" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="164">
                <summary>Returns the bit count for the BigUInt.</summary>

                <seealso cref="M:Microsoft.Research.SEAL.BigUInt.GetSignificantBitCount">See GetSignificantBitCount() to instead ignore leading zero bits.</seealso>

</member>
<member name="P:Microsoft.Research.SEAL.BigUInt.ByteCount" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="173">
                <summary>Returns the number of bytes in the backing array used to store the BigUInt value.</summary>

                <seealso cref="T:Microsoft.Research.SEAL.BigUInt">See BigUInt for a detailed description of the format of the backing array.</seealso>

</member>
<member name="P:Microsoft.Research.SEAL.BigUInt.UInt64Count" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="182">
                <summary>Returns the number of System::UInt64 in the backing array used to store the BigUInt value.</summary>

                <seealso cref="T:Microsoft.Research.SEAL.BigUInt">See BigUInt for a detailed description of the format of the backing array.</seealso>

</member>
<member name="P:Microsoft.Research.SEAL.BigUInt.Pointer" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="191">
                <summary>Returns a pointer to the backing array storing the BigUInt value.</summary>
                <remarks>
                Returns a pointer to the backing array storing the BigUInt value. The pointer points to the beginning of 
                the backing array at the least-significant quad word. The pointer is valid only until the backing array is
                freed, which occurs when the BigUInt is resized or destroyed.
                </remarks>

                <seealso cref="P:Microsoft.Research.SEAL.BigUInt.UInt64Count">See UInt64Count to determine the number of System::UInt64 values in the
                backing array.</seealso>
                <seealso cref="T:Microsoft.Research.SEAL.BigUInt">See BigUInt for a detailed description of the format of the backing array.</seealso>

</member>
<member name="P:Microsoft.Research.SEAL.BigUInt.IsZero" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="207">
<summary>Returns whether or not the BigUInt has the value zero.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.BigUInt.default(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="214">
                <summary>Gets/sets the byte at the corresponding byte index of the BigUInt's integer value.</summary>
                <remarks>
                Gets/sets the byte at the corresponding byte index of the BigUInt's integer value. The bytes of the BigUInt 
                are indexed least-significant byte first.
                </remarks>

                <param name="index">The index of the byte to get/set</param>
                <exception cref="T:System.ArgumentOutOfRangeException">If index is not within [0, <see cref="P:Microsoft.Research.SEAL.BigUInt.ByteCount"/>)</exception>
                <seealso cref="T:Microsoft.Research.SEAL.BigUInt">See BigUInt for a detailed description of the format of the backing array.</seealso>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.GetSignificantBitCount" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="230">
                <summary>Returns the number of significant bits for the BigUInt.</summary>

                <seealso cref="P:Microsoft.Research.SEAL.BigUInt.BitCount">See BitCount to instead return the bit count regardless of leading zero bits.</seealso>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.Set(Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="237">
                <summary>Overwrites the BigUInt with the value of the specified BigUInt, enlarging if needed to fit the assigned
                value.</summary>
                <remarks>
                Overwrites the BigUInt with the value of the specified BigUInt, enlarging if needed to fit the assigned value.
                Only significant bits are used to size the BigUInt.
                </remarks>

                <param name="assign">The BigUInt whose value should be assigned to the current BigUInt</param>
                <exception cref="T:System.ArgumentNullException">If assign is null</exception>
                <exception cref="T:System.InvalidOperationException">If BigUInt is an alias and the assigned BigUInt is too large to fit
                the current bit width</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.Set(System.String)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="252">
                <summary>Overwrites the BigUInt with the unsigned hexadecimal value specified by the string, enlarging if needed to fit
                the assigned value.</summary>
                <remarks>
                Overwrites the BigUInt with the unsigned hexadecimal value specified by the string, enlarging if needed to fit the
                assigned value. The string must match the format returned by <see cref="M:Microsoft.Research.SEAL.BigUInt.ToString"/> and must consist of only the
                characters 0-9, A-F, or a-f, most-significant nibble first.
                </remarks>

                <param name="assign">The hexadecimal integer string specifying the value to assign</param>
                <exception cref="T:System.ArgumentNullException">If assign is null</exception>
                <exception cref="T:System.ArgumentException">If assign does not adhere to the expected format</exception>
                <exception cref="T:System.InvalidOperationException">If BigUInt is an alias and the assigned value is too large to fit
                the current bit width</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.Set(System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="269">
                <summary>Overwrites the BigUInt with the specified integer value, enlarging if needed to fit the value.</summary>

                <param name="assign">The value to assign</param>
                <exception cref="T:System.InvalidOperationException">If BigUInt is an alias and the significant bit count of assign is
                too large to fit the current bit width</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.SetZero" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="278">
<summary>Sets the BigUInt value to zero.</summary>
<remarks>
Sets the BigUInt value to zero. This does not resize the BigUInt.
</remarks>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.Save(System.IO.Stream)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="286">
                <summary>Saves the BigUInt to an output stream.</summary>
                <remarks>
                Saves the BigUInt to an output stream. The full state of the BigUInt is serialized, including insignificant bits. The
                output is in binary format and not human-readable. The output stream must have the "binary" flag set.
                </remarks>

                <param name="stream">The stream to save the BigUInt to</param>
                <exception cref="T:System.ArgumentNullException">If stream is null</exception>
                <seealso cref="M:Microsoft.Research.SEAL.BigUInt.Load(System.IO.Stream)">See Load() to load a saved BigUInt.</seealso>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.Load(System.IO.Stream)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="299">
                <summary>Loads a BigUInt from an input stream overwriting the current BigUInt and enlarging if needed to fit the loaded
                BigUInt.</summary>

                <param name="stream">The stream to load the BigUInt from</param>
                <exception cref="T:System.ArgumentNullException">If stream is null</exception>
                <exception cref="T:System.InvalidOperationException">If BigUInt is an alias and the loaded BigUInt is too large to fit
                with the current bit width</exception>
                <seealso cref="M:Microsoft.Research.SEAL.BigUInt.Save(System.IO.Stream)">See Save() to save a BigUInt.</seealso>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.Resize(System.Int32)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="311">
                <summary>Resizes the BigUInt to the specified bit width, copying over the old value as much as will fit.</summary>

                <param name="bitCount">The bit width</param>
                <exception cref="T:System.ArgumentException">if bitCount is negative</exception>
                <exception cref="T:System.InvalidOperationException">If the BigUInt is an alias</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.Equals(Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="320">
                <summary>Returns whether or not a BigUInt is equal to a second BigUInt.</summary>
                <remarks>
                Returns whether or not a BigUInt is equal to a second BigUInt. The input operands are not modified.
                </remarks>

                <param name="compare">The value to compare against</param>
                <exception cref="T:System.ArgumentNullException">If compare is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.Equals(System.Object)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="331">
                <summary>Returns whether or not a BigUInt is equal to a second BigUInt.</summary>
                <remarks>
                Returns whether or not a BigUInt is equal to a second BigUInt. The input operands are not modified.
                </remarks>

                <param name="compare">The value to compare against</param>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.ToBigInteger" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="341">
<summary>Returns the BigUInt value as a <see cref="T:System.Numerics.BigInteger"/>.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.ToString" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="346">
<summary>Returns the BigUInt value as a hexadecimal string.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.ToDecimalString" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="351">
<summary>Returns the BigUInt value as a decimal string.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.GetHashCode" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="356">
<summary>Returns a hash-code based on the value of the BigUInt.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.Dispose" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="361">
<summary>Destroys the BigUInt, including deallocating any internally allocated space.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.Finalize" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="366">
<summary>Destroys the BigUInt, including deallocating any internally allocated space.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.CompareTo(Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="371">
                <summary>Compares two BigUInts and returns -1, 0, or 1 if the BigUInt is less-than, equal-to, or greater-than the
                second operand respectively.</summary>

                <remarks>
                Compares two BigUInts and returns -1, 0, or 1 if the BigUInt is less-than, equal-to, or greater-than the second
                operand respectively. The input operands are not modified.
                </remarks>
                <param name="compare">The value to compare against</param>
                <exception cref="T:System.ArgumentNullException">If compare is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.CompareTo(System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="384">
                <summary>Compares a BigUInt and an unsigned integer and returns -1, 0, or 1 if the BigUInt is less-than, equal-to, or
                greater-than the second operand respectively.</summary>

                <remarks>
                Compares a BigUInt and an unsigned integer and returns -1, 0, or 1 if the BigUInt is less-than, equal-to, or
                greater-than the second operand respectively. The input operands are not modified.
                </remarks>
                <param name="compare">The value to compare against</param>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.DivideRemainder(Microsoft.Research.SEAL.BigUInt,Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="396">
                <summary>Divides two BigUInts and returns the quotient and sets the remainder parameter to the remainder.</summary>

                <remarks>
                Divides two BigUInts and returns the quotient and sets the remainder parameter to the remainder. The bit count of the
                quotient is set to be the significant bit count of the BigUInt. The remainder is resized if and only if it is smaller
                than the bit count of the BigUInt.
                </remarks>
                <param name="operand2">The second operand to divide</param>
                <param name="remainder">The BigUInt to store the remainder</param>
                <exception cref="T:System.ArgumentNullException">If operand2 or remainder is null</exception>
                <exception cref="T:System.ArgumentException">If operand2 is zero</exception>
                <exception cref="T:System.InvalidOperationException">If the remainder is an alias and the operator attempts to enlarge
                the BigUInt to fit the result</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.DivideRemainder(System.UInt64,Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="413">
                <summary>Divides a BigUInt and an unsigned integer and returns the quotient and sets the remainder parameter to the
                remainder.</summary>

                <remarks>
                Divides a BigUInt and an unsigned integer and returns the quotient and sets the remainder parameter to the remainder.
                The bit count of the quotient is set to be the significant bit count of the BigUInt. The remainder is resized if and
                only if it is smaller than the bit count of the BigUInt.
                </remarks>
                <param name="operand2">The second operand to divide</param>
                <param name="remainder">The BigUInt to store the remainder</param>
                <exception cref="T:System.ArgumentNullException">If remainder is null</exception>
                <exception cref="T:System.ArgumentException">If operand2 is zero</exception>
                <exception cref="T:System.InvalidOperationException">If the remainder is an alias which the function attempts to enlarge
                to fit the result</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.ModuloInvert(Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="431">
                <summary>Returns the inverse of a BigUInt with respect to the specified modulus.</summary>

                <remarks>
                Returns the inverse of a BigUInt with respect to the specified modulus. The original BigUInt is not modified. The bit
                count of the inverse is set to be the significant bit count of the modulus.
                </remarks>
                <param name="modulus">The modulus to calculate the inverse with respect to</param>
                <exception cref="T:System.ArgumentNullException">If modulus is null</exception>
                <exception cref="T:System.ArgumentException">If modulus is zero</exception>
                <exception cref="T:System.ArgumentException">If modulus is not greater than the BigUInt value</exception>
                <exception cref="T:System.ArgumentException">If the BigUInt value and modulus are not co-prime</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.ModuloInvert(System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="446">
                <summary>Returns the inverse of a BigUInt with respect to the specified modulus.</summary>

                <remarks>
                Returns the inverse of a BigUInt with respect to the specified modulus. The original BigUInt is not modified. The bit
                count of the inverse is set to be the significant bit count of the modulus.
                </remarks>
                <param name="modulus">The modulus to calculate the inverse with respect to</param>
                <exception cref="T:System.ArgumentException">If modulus is zero</exception>
                <exception cref="T:System.ArgumentException">If modulus is not greater than the BigUInt value</exception>
                <exception cref="T:System.ArgumentException">If the BigUInt value and modulus are not co-prime</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.TryModuloInvert(Microsoft.Research.SEAL.BigUInt,Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="460">
                <summary>Attempts to calculate the inverse of a BigUInt with respect to the specified modulus, returning whether or not
                the inverse was successful and setting the inverse parameter to the inverse.</summary>

                <remarks>
                Attempts to calculate the inverse of a BigUInt with respect to the specified modulus, returning whether or not the
                inverse was successful and setting the inverse parameter to the inverse. The original BigUInt is not modified. The
                inverse parameter is resized if and only if its bit count is smaller than the significant bit count of the modulus.
                </remarks>
                <param name="modulus">The modulus to calculate the inverse with respect to</param>
                <param name="inverse">Stores the inverse if the inverse operation was successful</param>
                <exception cref="T:System.ArgumentNullException">If modulus or inverse is null</exception>
                <exception cref="T:System.ArgumentException">If modulus is zero</exception>
                <exception cref="T:System.ArgumentException">If modulus is not greater than the BigUInt value</exception>
                <exception cref="T:System.InvalidOperationException">If the inverse is an alias which the function attempts to enlarge
                to fit the result</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.TryModuloInvert(System.UInt64,Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="479">
                <summary>Attempts to calculate the inverse of a BigUInt with respect to the specified modulus, returning whether or not
                the inverse was successful and setting the inverse parameter to the inverse.</summary>

                <remarks>
                Attempts to calculate the inverse of a BigUInt with respect to the specified modulus, returning whether or not the
                inverse was successful and setting the inverse parameter to the inverse. The original BigUInt is not modified. The
                inverse parameter is resized if and only if its bit count is smaller than the significant bit count of the modulus.
                </remarks>
                <param name="modulus">The modulus to calculate the inverse with respect to</param>
                <param name="inverse">Stores the inverse if the inverse operation was successful</param>
                <exception cref="T:System.ArgumentNullException">If inverse is null</exception>
                <exception cref="T:System.ArgumentException">If modulus is zero</exception>
                <exception cref="T:System.ArgumentException">If modulus is not greater than the BigUInt value</exception>
                <exception cref="T:System.InvalidOperationException">If the inverse is an alias which the function attempts to enlarge
                to fit the result</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_UnaryPlus(Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="498">
                <summary>Returns a copy of the BigUInt value resized to the significant bit count.</summary>

                <param name="operand">The operand to copy</param>
                <exception cref="T:System.ArgumentNullException">If operand is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_UnaryNegation(Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="506">
                <summary>Returns a negated copy of the BigUInt value.</summary>

                <remarks>
                Returns a negated copy of the BigUInt value. The bit count does not change.
                </remarks>
                <param name="operand">The operand to negate</param>
                <exception cref="T:System.ArgumentNullException">If operand is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_OnesComplement(Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="517">
                <summary>Returns an inverted copy of the BigUInt value.</summary>

                <remarks>
                Returns an inverted copy of the BigUInt value. The bit count does not change.
                </remarks>
                <param name="operand">The operand to invert</param>
                <exception cref="T:System.ArgumentNullException">If operand is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_Increment(Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="528">
                <summary>Increments the BigUInt and returns the incremented value.</summary>

                <remarks>
                Increments the BigUInt and returns the incremented value. The BigUInt will increment the bit count if needed to fit the
                carry.
                </remarks>
                <param name="operand">The operand to increment</param>
                <exception cref="T:System.ArgumentNullException">If operand is null</exception>
                <exception cref="T:System.InvalidOperationException">If BigUInt is an alias and a carry occurs requiring the BigUInt to
                be resized</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_Decrement(Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="542">
                <summary>Decrements the BigUInt and returns the decremented value.</summary>

                <remarks>
                Decrements the BigUInt and returns the decremented value. The bit count does not change.
                </remarks>
                <param name="operand">The operand to decrement</param>
                <exception cref="T:System.ArgumentNullException">If operand is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_Addition(Microsoft.Research.SEAL.BigUInt,Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="553">
                <summary>Adds two BigUInts and returns the sum.</summary>

                <remarks>
                Adds two BigUInts and returns the sum. The input operands are not modified. The bit count of the sum is set to be one
                greater than the significant bit count of the larger of the two input operands.
                </remarks>
                <param name="operand1">The first operand to add</param>
                <param name="operand2">The second operand to add</param>
                <exception cref="T:System.ArgumentNullException">If operand1 or operand2 is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_Addition(Microsoft.Research.SEAL.BigUInt,System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="566">
                <summary>Adds a BigUInt and an unsigned integer and returns the sum.</summary>

                <remarks>
                Adds a BigUInt and an unsigned integer and returns the sum. The input operands are not modified. The bit count of the
                sum is set to be one greater than the significant bit count of the larger of the two operands.
                </remarks>
                <param name="operand1">The first operand to add</param>
                <param name="operand2">The second operand to add</param>
                <exception cref="T:System.ArgumentNullException">If operand1 is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_Subtraction(Microsoft.Research.SEAL.BigUInt,Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="579">
                <summary>Subtracts two BigUInts and returns the difference.</summary>

                <remarks>
                Subtracts two BigUInts and returns the difference. The input operands are not modified. The bit count of the difference
                is set to be the significant bit count of the larger of the two input operands.
                </remarks>
                <param name="operand1">The first operand to subtract</param>
                <param name="operand2">The second operand to subtract</param>
                <exception cref="T:System.ArgumentNullException">If operand1 or operand2 is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_Subtraction(Microsoft.Research.SEAL.BigUInt,System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="592">
                <summary>Subtracts a BigUInt and an unsigned integer and returns the difference.</summary>

                <remarks>
                Subtracts a BigUInt and an unsigned integer and returns the difference. The input operands are not modified. The bit
                count of the difference is set to be the significant bit count of the larger of the two operands.
                </remarks>
                <param name="operand1">The first operand to subtract</param>
                <param name="operand2">The second operand to subtract</param>
                <exception cref="T:System.ArgumentNullException">If operand1 is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_Multiply(Microsoft.Research.SEAL.BigUInt,Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="605">
                <summary>Multiplies two BigUInts and returns the product.</summary>

                <remarks>
                Multiplies two BigUInts and returns the product. The input operands are not modified. The bit count of the product is
                set to be the sum of the significant bit counts of the two input operands.
                </remarks>
                <param name="operand1">The first operand to multiply</param>
                <param name="operand2">The second operand to multiply</param>
                <exception cref="T:System.ArgumentNullException">If operand1 or operand2 is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_Multiply(Microsoft.Research.SEAL.BigUInt,System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="618">
                <summary>Multiplies a BigUInt and an unsigned integer and returns the product.</summary>

                <remarks>
                Multiplies a BigUInt and an unsigned integer and returns the product. The input operands are not modified. The bit
                count of the product is set to be the sum of the significant bit counts of the two input operands.
                </remarks>
                <param name="operand1">The first operand to multiply</param>
                <param name="operand2">The second operand to multiply</param>
                <exception cref="T:System.ArgumentNullException">If operand1 is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_Division(Microsoft.Research.SEAL.BigUInt,Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="631">
                <summary>Divides two BigUInts and returns the quotient.</summary>

                <remarks>
                Divides two BigUInts and returns the quotient. The input operands are not modified. The bit count of the quotient is
                set to be the significant bit count of the first input operand.
                </remarks>
                <param name="operand1">The first operand to divide</param>
                <param name="operand2">The second operand to divide</param>
                <exception cref="T:System.ArgumentNullException">If operand1 or operand2 is null</exception>
                <exception cref="T:System.ArgumentException">If operand2 is zero</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_Division(Microsoft.Research.SEAL.BigUInt,System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="645">
                <summary>Divides a BigUInt and an unsigned integer and returns the quotient.</summary>

                <remarks>
                Divides a BigUInt and an unsigned integer and returns the quotient. The input operands are not modified. The bit count
                of the quotient is set to be the significant bit count of the first input operand.
                </remarks>
                <param name="operand1">The first operand to divide</param>
                <param name="operand2">The second operand to divide</param>
                <exception cref="T:System.ArgumentNullException">If operand1 is null</exception>
                <exception cref="T:System.ArgumentException">If operand2 is zero</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_Modulus(Microsoft.Research.SEAL.BigUInt,Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="659">
                <summary>Divides two BigUInts and returns the remainder.</summary>

                <remarks>
                Divides two BigUInts and returns the remainder. The input operands are not modified. The bit count of the remainder is
                set to be the significant bit count of the first input operand.
                </remarks>
                <param name="operand1">The first operand to divide</param>
                <param name="operand2">The second operand to divide</param>
                <exception cref="T:System.ArgumentNullException">If operand1 or operand2 is null</exception>
                <exception cref="T:System.ArgumentException">If operand2 is zero</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_Modulus(Microsoft.Research.SEAL.BigUInt,System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="673">
                <summary>Divides a BigUInt and an unsigned integer and returns the remainder.</summary>

                <remarks>
                Divides a BigUInt and an unsigned integer and returns the remainder. The input operands are not modified. The bit count
                of the remainder is set to be the significant bit count of the first input operand.
                </remarks>
                <param name="operand1">The first operand to divide</param>
                <param name="operand2">The second operand to divide</param>
                <exception cref="T:System.ArgumentNullException">If operand1 is null</exception>
                <exception cref="T:System.ArgumentException">If operand2 is zero</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_ExclusiveOr(Microsoft.Research.SEAL.BigUInt,Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="687">
                <summary>Performs a bit-wise XOR operation between two BigUInts and returns the result.</summary>

                <remarks>
                Performs a bit-wise XOR operation between two BigUInts and returns the result. The input operands are not modified. The
                bit count of the result is set to the maximum of the two input operand bit counts.
                </remarks>
                <param name="operand1">The first operand to XOR</param>
                <param name="operand2">The second operand to XOR</param>
                <exception cref="T:System.ArgumentNullException">If operand1 or operand2 is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_ExclusiveOr(Microsoft.Research.SEAL.BigUInt,System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="700">
                <summary>Performs a bit-wise XOR operation between a BigUInt and an unsigned integer and returns the result.</summary>

                <remarks>
                Performs a bit-wise XOR operation between a BigUInt and an unsigned integer and returns the result. The input operands
                are not modified. The bit count of the result is set to the maximum of the two input operand bit counts.
                </remarks>
                <param name="operand1">The first operand to XOR</param>
                <param name="operand2">The second operand to XOR</param>
                <exception cref="T:System.ArgumentNullException">If operand1 is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_BitwiseAnd(Microsoft.Research.SEAL.BigUInt,Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="713">
                <summary>Performs a bit-wise AND operation between two BigUInts and returns the result.</summary>

                <remarks>
                Performs a bit-wise AND operation between two BigUInts and returns the result. The input operands are not modified. The
                bit count of the result is set to the maximum of the two input operand bit counts.
                </remarks>
                <param name="operand1">The first operand to AND</param>
                <param name="operand2">The second operand to AND</param>
                <exception cref="T:System.ArgumentNullException">If operand1 or operand2 is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_BitwiseAnd(Microsoft.Research.SEAL.BigUInt,System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="726">
                <summary>Performs a bit-wise AND operation between a BigUInt and an unsigned integer and returns the result.</summary>

                <remarks>
                Performs a bit-wise AND operation between a BigUInt and an unsigned integer and returns the result. The input operands
                are not modified. The bit count of the result is set to the maximum of the two input operand bit counts.
                </remarks>
                <param name="operand1">The first operand to AND</param>
                <param name="operand2">The second operand to AND</param>
                <exception cref="T:System.ArgumentNullException">If operand1 is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_BitwiseOr(Microsoft.Research.SEAL.BigUInt,Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="739">
                <summary>Performs a bit-wise OR operation between two BigUInts and returns the result.</summary>

                <remarks>
                Performs a bit-wise OR operation between two BigUInts and returns the result. The input operands are not modified. The
                bit count of the result is set to the maximum of the two input operand bit counts.
                </remarks>
                <param name="operand1">The first operand to OR</param>
                <param name="operand2">The second operand to OR</param>
                <exception cref="T:System.ArgumentNullException">If operand1 or operand2 is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_BitwiseOr(Microsoft.Research.SEAL.BigUInt,System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="752">
                <summary>Performs a bit-wise OR operation between a BigUInt and an unsigned integer and returns the result.</summary>

                <remarks>
                Performs a bit-wise OR operation between a BigUInt and an unsigned integer and returns the result. The input operands
                are not modified. The bit count of the result is set to the maximum of the two input operand bit counts.
                </remarks>
                <param name="operand1">The first operand to OR</param>
                <param name="operand2">The second operand to OR</param>
                <exception cref="T:System.ArgumentNullException">If operand1 is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_LeftShift(Microsoft.Research.SEAL.BigUInt,System.Int32)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="765">
                <summary>Returns a left-shifted copy of the BigUInt.</summary>

                <remarks>
                Returns a left-shifted copy of the BigUInt. The bit count of the returned value is the sum of the original significant
                bit count and the shift amount.
                </remarks>
                <param name="operand1">The operand to left-shift</param>
                <param name="shift">The number of bits to shift by</param>
                <exception cref="T:System.ArgumentNullException">If operand1 is null</exception>
                <exception cref="T:System.ArgumentException">If shift is negative</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_RightShift(Microsoft.Research.SEAL.BigUInt,System.Int32)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="779">
                <summary>Returns a right-shifted copy of the BigUInt.</summary>

                <remarks>
                Returns a right-shifted copy of the BigUInt. The bit count of the returned value is the original significant bit count
                subtracted by the shift amount (clipped to zero if negative).
                </remarks>
                <param name="operand1">The operand to right-shift</param>
                <param name="shift">The number of bits to shift by</param>
                <exception cref="T:System.ArgumentNullException">If operand1 is null</exception>
                <exception cref="T:System.ArgumentException">If shift is negative</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_Explicit(Microsoft.Research.SEAL.BigUInt)~System.Double" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="793">
<summary>Returns the BigUInt value as a double.</summary>
<remarks>
Returns the BigUInt value as a double. Note that precision may be lost during the conversion.
</remarks>
<param name="value">The value to convert</param>
<exception cref="T:System.ArgumentNullException">If value is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_Explicit(Microsoft.Research.SEAL.BigUInt)~System.Single" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="803">
<summary>Returns the BigUInt value as a float.</summary>
<remarks>
Returns the BigUInt value as a float. Note that precision may be lost during the conversion.
</remarks>
<param name="value">The value to convert</param>
<exception cref="T:System.ArgumentNullException">If value is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_Explicit(Microsoft.Research.SEAL.BigUInt)~System.UInt64" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="813">
<summary>Returns the lower 64-bits of a BigUInt value.</summary>
<remarks>
Returns the lower 64-bits of a BigUInt value. Note that if the value is greater than 64-bits,
the higher bits are dropped.
</remarks>
<param name="value">The value to convert</param>
<exception cref="T:System.ArgumentNullException">If value is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_Explicit(Microsoft.Research.SEAL.BigUInt)~System.Int64" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="824">
<summary>Returns the lower 64-bits of a BigUInt value as a signed-integer.</summary>
<remarks>
Returns the lower 64-bits of a BigUInt value as a signed-integer. Note that if the value is greater than
64-bits, the result may be negative and the higher bits are dropped.
</remarks>
<param name="value">The value to convert</param>
<exception cref="T:System.ArgumentNullException">If value is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_Explicit(Microsoft.Research.SEAL.BigUInt)~System.UInt32" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="835">
<summary>Returns the lower 32-bits of a BigUInt value.</summary>
<remarks>
Returns the lower 32-bits of a BigUInt value. Note that if the value is greater than 32-bits,
the higher bits are dropped.
</remarks>
<param name="value">The value to convert</param>
<exception cref="T:System.ArgumentNullException">If value is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_Explicit(Microsoft.Research.SEAL.BigUInt)~System.Int32" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="846">
<summary>Returns the lower 32-bits of a BigUInt value as a signed-integer.</summary>
<remarks>
Returns the lower 32-bits of a BigUInt value as a signed-integer. Note that if the value is greater than
32-bits, the result may be negative and the higher bits are dropped.
</remarks>
<param name="value">The value to convert</param>
<exception cref="T:System.ArgumentNullException">If value is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.Of(System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="857">
                <summary>Creates a minimally sized BigUInt initialized to the specified unsigned integer value.</summary>

                <param name="value">The value to initialized the BigUInt to</param>
                <exception cref="T:System.ArgumentNullException">If value is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.GetUInt" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="865">
<summary>Returns a reference to the underlying C++ BigUInt.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.DuplicateTo(Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="870">
<summary>Duplicates the current BigUInt.</summary>
<remarks>
Duplicates the current BigUInt. The bit count and the value of the given BigUInt are set to be exactly the same as in
the current one.
</remarks>
<param name="destination">The BigUInt to overwrite with the duplicate</param>
<exception cref="T:System.ArgumentNullException">if destination is null</exception>
<exception cref="T:System.InvalidOperationException">if the destination BigUInt is an alias</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.DuplicateFrom(Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="882">
<summary>Duplicates a given BigUInt.</summary>
<remarks>
Duplicates a given BigUInt. The bit count and the value of the current BigUInt
are set to be exactly the same as in the given one.
</remarks>
<param name="value">The BigUInt to duplicate</param>
<exception cref="T:System.ArgumentNullException">if value is null</exception>
<exception cref="T:System.InvalidOperationException">if the current BigUInt is an alias</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.op_Implicit(System.String)~Microsoft.Research.SEAL.BigUInt" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="894">
                <summary>Creates a BigUInt initialized and minimally sized to fit the unsigned hexadecimal integer specified
                by the string.</summary>

                <remarks>
                Creates a BigUInt initialized and minimally sized to fit the unsigned hexadecimal integer specified by
                the string. The string matches the format returned by <see cref="M:Microsoft.Research.SEAL.BigUInt.ToString"/> and must consist of only
                the characters 0-9, A-F, or a-f, most-significant nibble first.
                </remarks>

                <param name="hexString">The hexadecimal integer string specifying the initial value</param>
                <exception cref="T:System.ArgumentNullException">If hexString is null</exception>
                <exception cref="T:System.ArgumentException">If hexString does not adhere to the expected format</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.#ctor(seal.BigUInt!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="911">
                <summary>Creates a deep copy of a C++ BigUInt.</summary>
                <remarks>
                Creates a deep copy of a BigUInt. The created BigUInt will have the same bit count and value as the original.
                </remarks>

                <param name="value">The BigUInt to copy from</param>

</member>
<member name="M:Microsoft.Research.SEAL.BigUInt.#ctor(seal.BigUInt*)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\biguintwrapper.h" line="921">
<summary>Initializes the BigUInt to use the specified C++ BigUInt.</summary>
<remarks>
Initializes the BigUInt to use the specified C++ BigUInt. This constructor does not copy the C++ BigUInt but actually
uses the specified C++ BigUInt as the backing data. Upon destruction, the managed BigUInt will not destroy the C++
BigUInt.
</remarks>
<param name="value">The BigUInt to use as the backing BigUInt</param>

</member>
<member name="T:Microsoft.Research.SEAL.BigPoly" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="20">
            <summary>Represents a polynomial consisting of a set of unsigned integer coefficients with a specified 
            bit width.</summary>
            <remarks>
            <para>
            Represents a polynomial consisting of a set of unsigned integer coefficients with a specified bit width.
            BigPolys are mutable and able to be resized. Individual coefficients can be read/written through the
            indexer property. A BigPoly has a set coefficient count (which can be read with <see cref="P:Microsoft.Research.SEAL.BigPoly.CoeffCount"/>)
            and coefficient bit width (which can be read with <see cref="P:Microsoft.Research.SEAL.BigPoly.CoeffBitCount"/>), and all coefficients in 
            a BigPoly have the same bit width. The coefficient count and bit width of a BigPoly is set initially by 
            the constructor, and can be resized either explicitly with the <see cref="M:Microsoft.Research.SEAL.BigPoly.Resize(System.Int32,System.Int32)"/> function, or implicitly 
            with for example assignment.
            </para>

            <para>
            A BigPoly's coefficients are stored sequentially, index-zero coefficient first, in a contiguous System::UInt64
            array. The width of each coefficient is rounded up to the next System::UInt64 width (i.e., to the next 64-bit
            boundary). The <see cref="P:Microsoft.Research.SEAL.BigPoly.CoeffUInt64Count"/> function returns the number of System::UInt64 values used per
            coefficient. The <see cref="P:Microsoft.Research.SEAL.BigPoly.UInt64Count"/> function returns the number of System::UInt64 values used to store
            all coefficients. Each coefficient is stored in an identical format to <see cref="T:Microsoft.Research.SEAL.BigUInt"/>, with the least 
            quad word first and the order of bits for each quad word dependent on the architecture's System::UInt64 
            representation. For each coefficient, the bits higher than the coefficient bit count must be set to zero to 
            prevent undefined behavior. The <see cref="P:Microsoft.Research.SEAL.BigPoly.Pointer"/> function returns a pointer to the first System::UInt64 
            of the array.
            </para>

            <para>
            Both the copy constructor and the Set function allocate more memory for the backing array when needed, 
            i.e. when the source polynomial has a larger backing array than the destination. Conversely, when the 
            destination backing array is already large enough, the data is only copied and the unnecessary higher degree 
            coefficients are set to zero. When new memory has to be allocated, only the significant coefficients of the 
            source polynomial are taken into account. This is is important, because it avoids unnecessary zero coefficients 
            to be included in the destination, which in some cases could accumulate and result in very large unnecessary 
            allocations. However, sometimes it is necessary to preserve the original coefficient count, even if some of 
            the leading coefficients are zero. This comes up for example when copying individual polynomials of ciphertext 
            <see cref="T:Microsoft.Research.SEAL.BigPolyArray"/> objects, as these polynomials need to have the leading coefficient equal to zero 
            to be considered valid by classes such as <see cref="T:Microsoft.Research.SEAL.Evaluator"/> and <see cref="T:Microsoft.Research.SEAL.Decryptor"/>. For this purpose 
            BigPoly contains functions <see cref="M:Microsoft.Research.SEAL.BigPoly.DuplicateFrom(Microsoft.Research.SEAL.BigPoly)"/> and <see cref="M:Microsoft.Research.SEAL.BigPoly.DuplicateTo(Microsoft.Research.SEAL.BigPoly)"/>, which create an exact 
            copy of the source BigPoly.
            </para>

            <para>
            An aliased BigPoly (which can be determined with <see cref="P:Microsoft.Research.SEAL.BigPoly.IsAlias"/>) is a special type of BigPoly that does 
            not manage its underlying System::UInt64 pointer that stores the coefficients. An aliased BigPoly supports most 
            of the same operations as a non-aliased BigPoly, including reading/writing the coefficients and assignment, 
            however an aliased BigPoly does not internally allocate or deallocate its backing array and, therefore, does not 
            support resizing. Any attempt, either explicitly or implicitly, to resize the BigPoly will result in an exception 
            being thrown. Aliased BigPoly's are only created internally.
            </para>

            <para>
            In general, reading a BigPoly is thread-safe while mutating is not. Specifically, the backing array may be 
            freed whenever a resize occurs or the BigPoly is destroyed, which would invalidate the address returned by 
            <see cref="P:Microsoft.Research.SEAL.BigPoly.Pointer"/> and the coefficients returned by the indexer property. When it is known a resize will 
            not occur, concurrent reading and mutating is safe as long as it is known that concurrent reading and mutating 
            for the same coefficient will not occur, as the reader may see a partially updated coefficient value. A non-aliased 
            BigPoly allocates its backing array from the global (thread-safe) memory pool. Consequently, creating or resizing 
            a large number of BigPolys can result in performance loss due to thread contention.
            </para>
            </remarks>

            <seealso cref="T:Microsoft.Research.SEAL.BigPolyArithmetic">See BigPolyArithmetic for arithmetic and modular functions on BigPolys.</seealso>
            <seealso cref="T:Microsoft.Research.SEAL.BigUInt">See BigUInt for more details on the coefficients returned by this[int].</seealso>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.#ctor" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="87">
<summary>Creates an empty BigPoly with zero coefficients and zero coefficient bit width.</summary>
<remarks>
Creates an empty BigPoly with zero coefficients and zero coefficient bit width. No memory is allocated
by this constructor.
</remarks>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.#ctor(System.Int32,System.Int32)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="96">
                <summary>Creates a zero-initialized BigPoly of the specified coefficient count and bit width.</summary>

                <param name="coeffCount">The number of coefficients</param>
                <param name="coeffBitCount">The bit width of each coefficient</param>
                <exception cref="T:System.ArgumentException">if either coeffCount or coeffBitCount is negative</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.#ctor(System.String)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="105">
<summary>Creates a BigPoly populated and minimally sized to fit the polynomial described by the formatted 
string.</summary>

<remarks>
<para>
Creates a BigPoly populated and minimally sized to fit the polynomial described by the formatted string.
</para>
<para>
The string description of the polynomial must adhere to the format returned by <see cref="M:Microsoft.Research.SEAL.BigPoly.ToString"/>,
which is of the form "7FFx^3 + 1x^1 + 3" and summarized by the following rules:
<list type="number">
<item><description>Terms are listed in order of strictly decreasing exponent</description></item>
<item><description>Coefficient values are non-negative and in hexadecimal format (upper and lower case
letters are both supported)</description></item>
<item><description>Exponents are positive and in decimal format</description></item>
<item><description>Zero coefficient terms (including the constant term) may be (but do not have to be) 
omitted</description></item>
<item><description>Term with the exponent value of one is written as x^1</description></item>
<item><description>Term with the exponent value of zero (the constant term) is written as just a hexadecimal 
number without x or exponent</description></item>
<item><description>Terms are separated exactly by &lt;space&gt;+&lt;space&gt;</description></item>
<item><description>Other than the +, no other terms have whitespace</description></item>
</list>
</para>
</remarks>
<param name="hexPoly">The formatted polynomial string specifying the initial value</param>
<exception cref="T:System.ArgumentNullException">if hexPoly is null</exception>
<exception cref="T:System.ArgumentException">if hexPoly does not adhere to the expected format</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.#ctor(System.Int32,System.Int32,System.String)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="137">
<summary>Creates a BigPoly of the specified coefficient count and bit width and initializes it with the 
polynomial described by the formatted string.</summary>

<remarks>
<para>
Creates a BigPoly of the specified coefficient count and bit width and initializes it with the polynomial
described by the formatted string.
</para>
<para>
The string description of the polynomial must adhere to the format returned by <see cref="M:Microsoft.Research.SEAL.BigPoly.ToString"/>, 
which is of the form "7FFx^3 + 1x^1 + 3" and summarized by the following rules:
<list type="number">
<item><description>Terms are listed in order of strictly decreasing exponent</description></item>
<item><description>Coefficient values are non-negative and in hexadecimal format (upper and lower case 
letters are both supported)</description></item>
<item><description>Exponents are positive and in decimal format</description></item>
<item><description>Zero coefficient terms (including the constant term) may be (but do not have to be) 
omitted</description></item>
<item><description>Term with the exponent value of one is written as x^1</description></item>
<item><description>Term with the exponent value of zero (the constant term) is written as just a hexadecimal 
number without x or exponent</description></item>
<item><description>Terms are separated exactly by &lt;space&gt;+&lt;space&gt;</description></item>
<item><description>Other than the +, no other terms have whitespace</description></item>
</list>
</para>
</remarks>
<param name="coeffCount">The number of coefficients</param>
<param name="coeffBitCount">The bit width of each coefficient</param>
<param name="hexPoly">The formatted polynomial string specifying the initial value</param>
<exception cref="T:System.ArgumentException">if either coeffCount or coeffBitCount is negative</exception>
<exception cref="T:System.ArgumentNullException">if hexPoly is null</exception>
<exception cref="T:System.ArgumentException">if hexPoly does not adhere to the expected format</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.#ctor(Microsoft.Research.SEAL.BigPoly)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="173">
<summary>Creates a deep copy of a BigPoly.</summary>

<remarks>
Creates a deep copy of a BigPoly. The created BigPoly will have the same coefficient count, coefficient bit 
count, and coefficient values as the original.
</remarks>
<param name="copy">The BigPoly to copy from</param>
<exception cref="T:System.ArgumentNullException">if copy is null</exception>

</member>
<member name="P:Microsoft.Research.SEAL.BigPoly.IsAlias" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="185">
                <summary>Returns whether or not the BigPoly is an alias.</summary>

                <seealso cref="T:Microsoft.Research.SEAL.BigPoly">See BigPoly for a detailed description of aliased BigPolys.</seealso>

</member>
<member name="P:Microsoft.Research.SEAL.BigPoly.CoeffCount" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="194">
                <summary>Returns the coefficient count for the BigPoly.</summary>

                <seealso cref="M:Microsoft.Research.SEAL.BigPoly.GetSignificantCoeffCount">See GetSignificantCoeffCount() to instead ignore the leading 
                coefficients that have a value of zero.</seealso>

</member>
<member name="P:Microsoft.Research.SEAL.BigPoly.CoeffBitCount" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="204">
                <summary>Returns the number of bits per coefficient.</summary>

                <seealso cref="M:Microsoft.Research.SEAL.BigPoly.GetSignificantCoeffBitCount">See GetSignificantCoeffBitCount() to instead get the number 
                of significant bits of the largest coefficient in the BigPoly.</seealso>

</member>
<member name="P:Microsoft.Research.SEAL.BigPoly.UInt64Count" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="214">
                <summary>Returns the total number of System::UInt64 in the backing array to store all of the coefficients 
                of the BigPoly.</summary>

                <seealso cref="P:Microsoft.Research.SEAL.BigPoly.CoeffUInt64Count">See CoeffUInt64Count to determine the number of System::UInt64 values 
                used for each individual coefficient.</seealso>
                <seealso cref="T:Microsoft.Research.SEAL.BigPoly">See BigPoly for a more detailed description of the format of the backing array.</seealso>

</member>
<member name="P:Microsoft.Research.SEAL.BigPoly.CoeffUInt64Count" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="226">
                <summary>Returns the number of System::UInt64 in the backing array used to store each coefficient.</summary>

                <seealso cref="P:Microsoft.Research.SEAL.BigPoly.UInt64Count">See UInt64Count to determine the total number of System::UInt64 values used to
                store all of the coefficients.</seealso>
                <seealso cref="T:Microsoft.Research.SEAL.BigPoly">See BigPoly for a more detailed description of the format of the backing array.</seealso>

</member>
<member name="P:Microsoft.Research.SEAL.BigPoly.Pointer" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="237">
<summary>Returns a pointer to the backing array storing all of the coefficient values.</summary>

<remarks>
<para>
Returns a pointer to the backing array storing all of the coefficient values. The pointer points to the 
beginning of the backing array where all coefficients are stored sequentially. The pointer points to the 
coefficient for the constant (degree 0) term of the BigPoly. Note that the return value will be null if 
the coefficient count and/or bit count is zero.
</para>
<para>
The pointer is valid only until the backing array is freed, which occurs when the BigPoly is resized or 
destroyed.
</para>
</remarks>
<seealso cref="P:Microsoft.Research.SEAL.BigPoly.CoeffUInt64Count">See CoeffUInt64Count to determine the number of System::UInt64 values 
used for each coefficient in the backing array.</seealso>
<seealso cref="T:Microsoft.Research.SEAL.BigPoly">See BigPoly for a more detailed description of the format of the backing array.</seealso>

</member>
<member name="P:Microsoft.Research.SEAL.BigPoly.IsZero" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="260">
<summary>Returns whether or not the BigPoly has all zero coefficients.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.BigPoly.default(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="267">
                <summary>Returns a BigUInt that can read or write the coefficient at the specified index.</summary>
                <remarks>
                <para>
                Returns a BigUInt that can read or write the coefficient at the specified index. The BigUInt is an aliased 
                BigUInt that points directly to the backing array of the BigPoly.
                </para>

                <para>
                The returned BigUInt is an alias backed by a region of the BigPoly's backing array. As such, it is only 
                valid until the BigPoly is resized or destroyed.
                </para>
                </remarks>

                <param name="index">The index of the coefficient to read/write</param>
                <exception cref="T:System.ArgumentOutOfRangeException">if index is not within [0, <see cref="P:Microsoft.Research.SEAL.BigPoly.CoeffCount"/>)</exception>
                <seealso cref="T:Microsoft.Research.SEAL.BigUInt">See BigUInt for operations that can be performed on the coefficients.</seealso>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.GetSignificantCoeffCount" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="289">
                <summary>Returns the coefficient count for the BigPoly ignoring all of the highest coefficients that have 
                value zero.</summary>

                <seealso cref="P:Microsoft.Research.SEAL.BigPoly.CoeffCount">See CoeffCount to instead return the coefficient count regardless of the number
                of leading zero terms.
                </seealso>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.GetSignificantCoeffBitCount" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="299">
                <summary>Returns the number of significant bits of the largest coefficient in the BigPoly.</summary>

                <seealso cref="P:Microsoft.Research.SEAL.BigPoly.CoeffBitCount">See CoeffBitCount to instead return the coefficient bit count regardless of 
                leading zero bits.</seealso>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.Set(Microsoft.Research.SEAL.BigPoly)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="307">
                <summary>Overwrites the BigPoly with the value of the specified BigPoly, enlarging if needed to fit the 
                assigned value.</summary>
                <remarks>
                Overwrites the BigPoly with the value of the specified BigPoly, enlarging if needed to fit the assigned value.
                Only significant coefficients and significant coefficient bit counts are used to size the BigPoly.
                </remarks>

                <param name="assign">The BigPoly whose value should be assigned to the current BigPoly</param>
                <exception cref="T:System.ArgumentNullException">if assign is null</exception>
                <exception cref="T:System.InvalidOperationException">if BigPoly is an alias and the assigned BigPoly is too 
                large to fit the current coefficient count and/or bit width</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.Set(System.String)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="322">
<summary>Overwrites the BigPoly with the value of the polynomial described by the formatted string, enlarging 
if needed to fit the assigned value.</summary>

<remarks>
<para>
Overwrites the BigPoly with the value of the polynomial described by the formatted string, enlarging if needed
to fit the assigned value.
</para>
<para>
The string description of the polynomial must adhere to the format returned by <see cref="M:Microsoft.Research.SEAL.BigPoly.ToString"/>, which 
is of the form "7FFx^3 + 1x^1 + 3" and summarized by the following rules:
<list type="number">
<item><description>Terms are listed in order of strictly decreasing exponent</description></item>
<item><description>Coefficient values are non-negative and in hexadecimal format (upper and lower case letters 
are both supported)</description></item>
<item><description>Exponents are positive and in decimal format</description></item>
<item><description>Zero coefficient terms (including the constant term) may be (but do not have to be) 
omitted</description></item>
<item><description>Term with the exponent value of one is written as x^1</description></item>
<item><description>Term with the exponent value of zero (the constant term) is written as just a hexadecimal 
number without x or exponent</description></item>
<item><description>Terms are separated exactly by &lt;space&gt;+&lt;space&gt;</description></item>
<item><description>Other than the +, no other terms have whitespace</description></item>
</list>
</para>
</remarks>
<param name="assign">The formatted polynomial string specifying the value to set</param>
<exception cref="T:System.ArgumentNullException">if assign is null</exception>
<exception cref="T:System.ArgumentException">if assign does not adhere to the expected format</exception>
<exception cref="T:System.InvalidOperationException">if BigPoly is an alias and the assigned polynomial is too 
large to fit the current coefficient count and/or bit width</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.SetZero" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="357">
<summary>Sets all coefficients to have a value of zero.</summary>

<remarks>
Sets all coefficients to have a value of zero. This does not resize the BigPoly.
</remarks>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.SetZero(System.Int32)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="366">
<summary>Sets all coefficients within [startCoeff, coefficient count) to have a value of zero.</summary>

<remarks>
Sets all coefficients within [startCoeff, coefficient count) to have a value of zero. This does not resize 
the BigPoly or modify the other coefficients.
</remarks>
<param name="startCoeff">The index of the first coefficient to set to zero</param>
<exception cref="T:System.ArgumentOutOfRangeException">if startCoeff is not within 
[0, <see cref="P:Microsoft.Research.SEAL.BigPoly.CoeffCount"/>]</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.SetZero(System.Int32,System.Int32)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="379">
<summary>Sets all coefficients within [startCoeff, startCoeff + length) to have a value of zero.</summary>

<remarks>
Sets all coefficients within [startCoeff, startCoeff + length) to have a value of zero. This does not resize 
the BigPoly or modify the other coefficients.
</remarks>
<param name="startCoeff">The index of the first coefficient to set to zero</param>
<param name="coeffCount">The number of coefficients to set to zero</param>
<exception cref="T:System.ArgumentOutOfRangeException">if startCoeff is not within 
[0, <see cref="P:Microsoft.Research.SEAL.BigPoly.CoeffCount"/>]</exception>
<exception cref="T:System.ArgumentOutOfRangeException">if length is negative or start_coeff + length is not
within [0, <see cref="P:Microsoft.Research.SEAL.BigPoly.CoeffCount"/>]</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.Save(System.IO.Stream)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="395">
<summary>Saves the BigPoly to an output stream.</summary>

<remarks>
Saves the BigPoly to an output stream. The full state of the BigPoly is serialized, including leading zero
coefficients and insignificant coefficient bits. The output is in binary format and not human-readable. The
output stream must have the "binary" flag set.
</remarks>
<param name="stream">The stream to save the BigPoly to</param>
<exception cref="T:System.ArgumentNullException">if stream is null</exception>
<seealso cref="M:Microsoft.Research.SEAL.BigPoly.Load(System.IO.Stream)">See Load() to load a saved BigPoly.</seealso>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.Load(System.IO.Stream)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="409">
                <summary>Loads a BigPoly from an input stream overwriting the current BigPoly and enlarging if needed to fit
                the loaded BigPoly.</summary>

                <param name="stream">The stream to load the BigPoly from</param>
                <exception cref="T:System.ArgumentNullException">if stream is null</exception>
                <exception cref="T:System.InvalidOperationException">if BigPoly is an alias and the loaded polynomial is too 
                large to fit the current coefficient count and/or bit width</exception>
                <seealso cref="M:Microsoft.Research.SEAL.BigPoly.Save(System.IO.Stream)">See Save() to save a BigPoly.</seealso>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.Resize(System.Int32,System.Int32)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="421">
<summary>Resizes a BigPoly to the specified coefficient count and bit width, copying over and resizing 
existing coefficient values as much as will fit.</summary>

<remarks>
Resizes a BigPoly to the specified coefficient count and bit width, copying over and resizing existing 
coefficient values as much as will fit. If coefficient count is reduced, the leading coefficients are 
dropped. If coefficient count increases, the new coefficients are initialized to zero.
</remarks>
<param name="coeffCount">The number of coefficients</param>
<param name="coeffBitCount">The bit width of each coefficient</param>
<exception cref="T:System.ArgumentException">if either coeffCount or coeffBitCount is negative</exception>
<exception cref="T:System.InvalidOperationException">if the BigPoly is an alias</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.Equals(Microsoft.Research.SEAL.BigPoly)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="437">
<summary>Returns whether or not the BigPoly has the same value as a specified BigPoly.</summary>

<remarks>
Returns whether or not the BigPoly has the same value as a specified BigPoly. Value equality is not 
determined by the raw coefficient count or bit count, but rather if the significant bits of non-zero 
coefficients have the same value.
</remarks>
<param name="compare">The BigPoly to compare against</param>
<exception cref="T:System.ArgumentNullException">if compare is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.Equals(System.Object)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="450">
<summary>Returns whether or not the BigPoly has the same value as a specified BigPoly.</summary>

<remarks>
Returns whether or not the BigPoly has the same value as a specified BigPoly. Value equality is not determined 
by the raw coefficient count or bit count, but rather if the significant bits of non-zero coefficients have 
the same value.
</remarks>
<param name="compare">The BigPoly to compare against</param>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.ToString" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="462">
<summary>Returns a human-readable string description of the BigPoly.</summary>
<remarks>
<para>
Returns a human-readable string description of the BigPoly.
</para>
<para>
The returned string is of the form "7FFx^3 + 1x^1 + 3" with a format summarized by the following:
<list type="number">
<item><description>Terms are listed in order of strictly decreasing exponent</description></item>
<item><description>Coefficient values are non-negative and in hexadecimal format (hexadecimal letters are in 
upper-case)</description></item>
<item><description>Exponents are positive and in decimal format</description></item>
<item><description>Zero coefficient terms (including the constant term) are omitted unless the BigPoly is 
exactly 0 (see rule 9)</description></item>
<item><description>Term with the exponent value of one is written as x^1</description></item>
<item><description>Term with the exponent value of zero (the constant term) is written as just a hexadecimal 
number without x or exponent</description></item>
<item><description>Terms are separated exactly by &lt;space&gt;+&lt;space&gt;</description></item>
<item><description>Other than the +, no other terms have whitespace</description></item>
<item><description>If the BigPoly is exactly 0, the string "0" is returned</description></item>
</list>
</para>
</remarks>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.GetHashCode" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="489">
<summary>Returns a hash-code based on the value of the BigPoly.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.Dispose" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="494">
<summary>Destroys the BigPoly, including deallocating any internally allocated space.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.Finalize" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="499">
<summary>Destroys the BigPoly, including deallocating any internally allocated space.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.GetPolynomial" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="504">
<summary>Returns a reference to the underlying C++ BigPoly.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.DuplicateTo(Microsoft.Research.SEAL.BigPoly)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="509">
<summary>Duplicates the current BigPoly.</summary>
<remarks>
Duplicates the current BigPoly. The coefficient count, the coefficient bit count, and the value of the given 
BigPoly are set to be exactly the same as in the current one.
</remarks>
<param name="destination">The BigPoly to overwrite with the duplicate</param>
<exception cref="T:System.ArgumentNullException">if destination is null</exception>
<exception cref="T:System.InvalidOperationException">if the destination BigPoly is an alias</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.DuplicateFrom(Microsoft.Research.SEAL.BigPoly)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="521">
<summary>Duplicates a given BigPoly.</summary>
<remarks>
Duplicates a given BigPoly. The coefficient count, the coefficient bit count,
and the value of the current BigPoly are set to be exactly the same as in the given one.
</remarks>
<param name="value">The BigPoly to duplicate</param>
<exception cref="T:System.ArgumentNullException">if value is null</exception>
<exception cref="T:System.InvalidOperationException">if the current BigPoly is an alias</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.op_Implicit(System.String)~Microsoft.Research.SEAL.BigPoly" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="533">
<summary>Creates a BigPoly populated and minimally sized to fit the polynomial described by the formatted 
string.</summary>

<remarks>
<para>
Creates a BigPoly populated and minimally sized to fit the polynomial described by the formatted string.
</para>
<para>
The string description of the polynomial must adhere to the format returned by <see cref="M:Microsoft.Research.SEAL.BigPoly.ToString"/>,
which is of the form "7FFx^3 + 1x^1 + 3" and summarized by the following rules:
<list type="number">
<item><description>Terms are listed in order of strictly decreasing exponent</description></item>
<item><description>Coefficient values are non-negative and in hexadecimal format (upper and lower case
letters are both supported)</description></item>
<item><description>Exponents are positive and in decimal format</description></item>
<item><description>Zero coefficient terms (including the constant term) may be (but do not have to be) 
omitted</description></item>
<item><description>Term with the exponent value of one is written as x^1</description></item>
<item><description>Term with the exponent value of zero (the constant term) is written as just a hexadecimal 
number without x or exponent</description></item>
<item><description>Terms are separated exactly by &lt;space&gt;+&lt;space&gt;</description></item>
<item><description>Other than the +, no other terms have whitespace</description></item>
</list>
</para>
</remarks>
<param name="hexPoly">The formatted polynomial string specifying the initial value</param>
<exception cref="T:System.ArgumentNullException">if hexPoly is null</exception>
<exception cref="T:System.ArgumentException">if hexPoly does not adhere to the expected format</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.#ctor(seal.BigPoly!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="566">
                <summary>Creates a deep copy of a C++ BigPoly.</summary>
                <remarks>
                Creates a deep copy of a C++ BigPoly. The created BigPoly will have the same coefficient count, coefficient 
                bit count, and coefficient values as the original.
                </remarks>

                <param name="value">The BigPoly to copy from</param>

</member>
<member name="M:Microsoft.Research.SEAL.BigPoly.#ctor(seal.BigPoly*)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\bigpolywrapper.h" line="577">
<summary>Initializes the BigPoly to use the specified C++ BigPoly.</summary>
<remarks>
Initializes the BigPoly to use the specified C++ BigPoly. This constructor does not copy the C++ BigPoly 
but actually uses the specified C++ BigPoly as the backing data. Upon destruction, the managed BigPoly will
not destroy the C++ BigPoly.
</remarks>
<param name="value">The BigPoly to use as the backing BigPoly</param>

</member>
<!-- Discarding badly formed XML document comment for member 'M:Microsoft.Research.SEAL.BigPoly.#ctor(System.Int32,System.Int32,System.UInt64*)'. -->
<!-- Discarding badly formed XML document comment for member 'T:Microsoft.Research.SEAL.MemoryPoolHandle'. -->
<member name="M:Microsoft.Research.SEAL.MemoryPoolHandle.#ctor" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\memorypoolhandlewrapper.h" line="75">
<summary>Creates a new uninitialized MemoryPoolHandle.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.MemoryPoolHandle.#ctor(Microsoft.Research.SEAL.MemoryPoolHandle)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\memorypoolhandlewrapper.h" line="80">
                <summary>Creates a copy of a given MemoryPoolHandle.</summary>

                <remarks>
                Creates a copy of a given MemoryPoolHandle. As a result, the created
                MemoryPoolHandle will point to the same underlying memory pool as the copied
                instance.
                </remarks>

                <param name="copy">The MemoryPoolHandle to copy from</param>
                <exception cref="T:System.ArgumentNullException">if copy is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.MemoryPoolHandle.Set(Microsoft.Research.SEAL.MemoryPoolHandle)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\memorypoolhandlewrapper.h" line="94">
                <summary>Overwrites the MemoryPoolHandle instance with the specified 
                instance.</summary>

                <remarks>
                Overwrites the MemoryPoolHandle instance with the specified instance. As a result,
                the current MemoryPoolHandle will point to the same underlying memory pool as the 
                assigned instance.
                </remarks>
                <param name="assign">The MemoryPoolHandle instance to assign to the current 
                instance</param>
                <exception cref="T:System.ArgumentNullException">if assign is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.MemoryPoolHandle.Global" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\memorypoolhandlewrapper.h" line="109">
<summary>Returns a MemoryPoolHandle pointing to the global memory pool.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.MemoryPoolHandle.New" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\memorypoolhandlewrapper.h" line="114">
<summary>Returns a MemoryPoolHandle pointing to a new thread-safe memory
pool.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.MemoryPoolHandle.PoolCount" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\memorypoolhandlewrapper.h" line="133">
                <summary>Returns the number of different allocation sizes.</summary>

                <remarks>
                Returns the number of different allocation sizes. This function returns the
                number of different allocation sizes the memory pool pointed to by the current
                MemoryPoolHandle has made. For example, if the memory pool has only allocated
                two allocations of sizes 128 KB, this function returns 1. If it has instead
                allocated one allocation of size 64 KB and one of 128 KB, this functions
                returns 2.
                </remarks>
                <exception cref="T:System.InvalidOperationException">if the MemoryPoolHandle is
                uninitialized</exception>

</member>
<member name="P:Microsoft.Research.SEAL.MemoryPoolHandle.AllocUInt64Count" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\memorypoolhandlewrapper.h" line="151">
                <summary>Returns the size of allocated memory.</summary>

                <remarks>
                Returns the size of allocated memory. This functions returns the total amount
                of memory (in 64-bit words) allocated by the memory pool pointed to by the
                current MemoryPoolHandle.
                </remarks>
                <exception cref="T:System.InvalidOperationException">if the MemoryPoolHandle is
                uninitialized</exception>

</member>
<member name="P:Microsoft.Research.SEAL.MemoryPoolHandle.AllocByteCount" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\memorypoolhandlewrapper.h" line="166">
                <summary>Returns the size of allocated memory.</summary>

                <remarks>
                Returns the size of allocated memory. This functions returns the total amount
                of memory (in bytes) allocated by the memory pool pointed to by the current 
                MemoryPoolHandle.
                </remarks>
                <exception cref="T:System.InvalidOperationException">if the MemoryPoolHandle is
                uninitialized</exception>

</member>
<member name="M:Microsoft.Research.SEAL.MemoryPoolHandle.op_Implicit(Microsoft.Research.SEAL.MemoryPoolHandle)~System.Boolean" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\memorypoolhandlewrapper.h" line="181">
<summary>Returns whether the MemoryPoolHandle is initialized.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.MemoryPoolHandle.Dispose" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\memorypoolhandlewrapper.h" line="186">
<summary>Destroys the MemoryPoolHandle.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.MemoryPoolHandle.Finalize" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\memorypoolhandlewrapper.h" line="191">
<summary>Destroys the MemoryPoolHandle.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.MemoryPoolHandle.GetHandle" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\memorypoolhandlewrapper.h" line="199">
<summary>Returns a reference to the underlying C++ MemoryPoolHandle.</summary>

</member>
<member name="T:Microsoft.Research.SEAL.EncryptionParameters" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encryptionparamswrapper.h" line="41">
<summary>Represents the user-customizable encryption scheme settings.</summary> 

<remarks>
<para>
Represents user-customizable encryption scheme settings. The parameters (most
importantly PolyModulus, CoeffModulus, PlainModulus) significantly affect the 
performance, capabilities, and security of the encryption scheme. Once an 
instance of EncryptionParameters is populated with appropriate parameters, it 
can be used to create an instance of the <see cref="T:Microsoft.Research.SEAL.SEALContext"/> class, 
which verifies the validity of the parameters, and performs necessary 
pre-computations.
</para>
<para>
Picking appropriate encryption parameters is essential to enable a particular
application while balancing performance and security. Some encryption settings
will not allow some inputs (e.g. attempting to encrypt a polynomial with more
coefficients than PolyModulus or larger coefficients than PlainModulus) or 
support the desired computations (with noise growing too fast due to too large 
PlainModulus and too small CoeffModulus).
</para>
<para>
The EncryptionParameters class maintains at all times a 256-bit SHA-3 hash of
the currently set encryption parameters. This hash is then stored by all further
objects created for these encryption parameters, e.g. <see cref="T:Microsoft.Research.SEAL.SEALContext"/>,
<see cref="T:Microsoft.Research.SEAL.KeyGenerator"/>, <see cref="T:Microsoft.Research.SEAL.Encryptor"/>, <see cref="T:Microsoft.Research.SEAL.Decryptor"/>,
<see cref="T:Microsoft.Research.SEAL.Evaluator"/>, all secret and public keys, and ciphertexts. The hash 
block is not intended to be directly modified by the user, and is used internally 
to perform quick input compatibility checks.
</para>
<para>
In general, reading from EncryptionParameters is thread-safe, while mutating is not.
</para>
<para>
Choosing inappropriate encryption parameters may lead to an encryption scheme 
that is not secure, does not perform well, and/or does not support the input 
and computation of the desired application. We highly recommend consulting an 
expert in RLWE-based encryption when selecting parameters, as this is where
inexperienced users seem to most    often make critical mistakes.
</para>
</remarks>

</member>
<member name="M:Microsoft.Research.SEAL.EncryptionParameters.#ctor" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encryptionparamswrapper.h" line="86">
<summary>Creates an empty encryption parameters.</summary>

<remarks>
Creates an empty encryption parameters. At a minimum, the user needs to specify 
the parameters <see cref="P:Microsoft.Research.SEAL.EncryptionParameters.PolyModulus"/>, <see cref="P:Microsoft.Research.SEAL.EncryptionParameters.CoeffModulus"/>, and 
<see cref="P:Microsoft.Research.SEAL.EncryptionParameters.PlainModulus"/> for the parameters to be valid.
</remarks>

</member>
<member name="M:Microsoft.Research.SEAL.EncryptionParameters.#ctor(Microsoft.Research.SEAL.EncryptionParameters)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encryptionparamswrapper.h" line="97">
                <summary>Creates a copy of a given instance of EncryptionParameters.</summary>

                <param name="copy">The EncryptionParameters to copy from</param>
                <exception cref="T:System.ArgumentNullException">if copy is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.EncryptionParameters.Set(Microsoft.Research.SEAL.EncryptionParameters)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encryptionparamswrapper.h" line="105">
                <summary>Overwrites the EncryptionParameters instance with a copy of a given 
                instance.</summary>

                <param name="assign">The EncryptionParameters to copy from</param>
                <exception cref="T:System.ArgumentNullException">if assign is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.EncryptionParameters.get_PolyModulus" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encryptionparamswrapper.h" line="115">
<summary>Returns a copy of the currently set polynomial modulus parameter.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.EncryptionParameters.set_PolyModulus(Microsoft.Research.SEAL.BigPoly)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encryptionparamswrapper.h" line="120">
                    <summary>Sets the polynomial modulus parameter to the specified value.</summary>

                    <remarks>
                    Sets the polynomial modulus parameter to the specified value (represented by
                    <see cref="T:Microsoft.Research.SEAL.BigPoly"/>). The polynomial modulus directly affects the number
                    of coefficients in plaintext polynomials, the size of ciphertext elements, the
                    computational performance of the scheme (bigger is worse), and the security
                    level (bigger is better). In SEAL the polynomial modulus must be of the form
                    "1x^N + 1", where N is a power of 2 (e.g. 1024, 2048, 4096, 8192, 16384, or 32768).
                    </remarks>
                    <param name="polyModulus">The new polynomial modulus</param>
                    <exception cref="T:System.ArgumentNullException">if polyModulus is null</exception>
                    <exception cref="T:System.ArgumentException">if polyModulus is too large</exception>

</member>
<member name="M:Microsoft.Research.SEAL.EncryptionParameters.get_CoeffModulus" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encryptionparamswrapper.h" line="139">
<summary>Returns a copy of the currently set coefficient modulus parameter.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.EncryptionParameters.set_CoeffModulus(System.Collections.Generic.List`1{Microsoft.Research.SEAL.SmallModulus})" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encryptionparamswrapper.h" line="144">
                    <summary>Sets the coefficient modulus parameter.</summary>

                    <remarks>
                    Sets the coefficient modulus parameter. The coefficient modulus consists of a list
                    of distinct prime numbers, and is represented by a list of <see cref="T:Microsoft.Research.SEAL.SmallModulus"/>
                    objects. The coefficient modulus directly affects the size of ciphertext elements,
                    the amount of computation that the scheme can perform (bigger is better), and the
                    security level (bigger is worse). In SEAL each of the prime numbers in the coefficient
                    modulus must be at most 60 bits, and must be congruent to 1 modulo 2*degree(PolyModulus).
                    </remarks>
                    <param name="coeffModulus">The new coefficient modulus</param>
                    <exception cref="T:System.ArgumentNullException">if coeffModulus is null</exception>
                    <exception cref="T:System.ArgumentException">if coeffModulus is too large</exception>

</member>
<member name="M:Microsoft.Research.SEAL.EncryptionParameters.get_PlainModulus" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encryptionparamswrapper.h" line="163">
<summary>Returns a copy of the currently set plaintext modulus parameter.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.EncryptionParameters.set_PlainModulus(Microsoft.Research.SEAL.SmallModulus)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encryptionparamswrapper.h" line="168">
                    <summary>Sets the plaintext modulus parameter.</summary>

                    <remarks>
                    Sets the plaintext modulus parameter. The plaintext modulus is an integer modulus
                    represented by the <see cref="T:Microsoft.Research.SEAL.SmallModulus"/> class. The plaintext modulus determines
                    the largest coefficient that plaintext polynomials can represent. It also affects the
                    amount of computation that the scheme can perform (bigger is worse). In SEAL the
                    plaintext modulus can be at most 60 bits long, but can otherwise be any integer. Note,
                    however, that some features (e.g. batching) require the plaintext modulus to be of
                    a particular form.
                    </remarks>
                    <param name="plainModulus">The new plaintext modulus</param>
                    <exception cref="T:System.ArgumentNullException">if plainModulus is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.EncryptionParameters.get_NoiseStandardDeviation" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encryptionparamswrapper.h" line="187">
<summary>Returns the currently set standard deviation of the noise distribution.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.EncryptionParameters.set_NoiseStandardDeviation(System.Double)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encryptionparamswrapper.h" line="192">
                    <summary>Sets the standard deviation of the noise distribution used for error
                    sampling.</summary>

                    <remarks>
                    Sets the standard deviation of the noise distribution used for error sampling. This
                    parameter directly affects the security level of the scheme. However, it should not be
                    necessary for most users to change this parameter from its default value.
                    </remarks>
                    <param name="value">The new standard deviation</param>

</member>
<member name="P:Microsoft.Research.SEAL.EncryptionParameters.NoiseMaxDeviation" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encryptionparamswrapper.h" line="206">
                <summary>Returns the currently set maximum deviation of the noise distribution.</summary>

                <remarks>
                Returns the currently set maximum deviation of the noise distribution. This value
                cannot be directly controlled by the user, and is automatically set to be an
                appropriate multiple of the NoiseStandardDeviation parameter.
                </remarks>

</member>
<member name="M:Microsoft.Research.SEAL.EncryptionParameters.Save(System.IO.Stream)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encryptionparamswrapper.h" line="219">
                <summary>Saves the EncryptionParameters to an output stream.</summary>

                <remarks>
                Saves the EncryptionParameters to an output stream. The output is in binary format
                and is not human-readable. The output stream must have the "Binary" flag set.
                </remarks>
                <param name="stream">The stream to save the EncryptionParameters to</param>
                <exception cref="T:System.ArgumentNullException">if stream is null</exception>
                <seealso cref="M:Microsoft.Research.SEAL.EncryptionParameters.Load(System.IO.Stream)">See Load() to load a saved EncryptionParameters instance.</seealso>

</member>
<member name="M:Microsoft.Research.SEAL.EncryptionParameters.Load(System.IO.Stream)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encryptionparamswrapper.h" line="232">
                <summary>Loads the EncryptionParameters from an input stream overwriting the current
                EncryptionParameters.</summary>

                <param name="stream">The stream to load the EncryptionParameters from</param>
                <exception cref="T:System.ArgumentNullException">if stream is null</exception>
                <seealso cref="M:Microsoft.Research.SEAL.EncryptionParameters.Save(System.IO.Stream)">See Save() to save an EncryptionParameters instance.</seealso>

</member>
<member name="P:Microsoft.Research.SEAL.EncryptionParameters.HashBlock" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encryptionparamswrapper.h" line="242">
                <summary>Returns the hash block of the current parameters.</summary>

                <remarks>
                Returns the hash block of the current parameters. This function is intended
                mainly for internal use.
                </remarks>

</member>
<member name="M:Microsoft.Research.SEAL.EncryptionParameters.Equals(Microsoft.Research.SEAL.EncryptionParameters)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encryptionparamswrapper.h" line="254">
                <summary>Compares a given set of encryption parameters to the current set of 
                encryption parameters.</summary>

                <remarks>
                Compares a given set of encryption parameters to the current set of encryption
                parameters. The comparison is performed by comparing hash blocks of the parameter
                sets rather than comparing the parameters individually.
                </remarks>
                <param name="compare">The EncryptionParameters to compare against</param>

</member>
<member name="M:Microsoft.Research.SEAL.EncryptionParameters.Equals(System.Object)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encryptionparamswrapper.h" line="267">
                <summary>Compares a given set of encryption parameters to the current set of
                encryption parameters.</summary>

                <remarks>
                Compares a given set of encryption parameters to the current set of encryption
                parameters. The comparison is performed by comparing hash blocks of the parameter
                sets rather than comparing the parameters individually.
                </remarks>
                <param name="compare">The EncryptionParameters to compare against</param>

</member>
<member name="M:Microsoft.Research.SEAL.EncryptionParameters.GetHashCode" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encryptionparamswrapper.h" line="280">
<summary>Returns a hash-code based on the EncryptionParameters.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.EncryptionParameters.Dispose" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encryptionparamswrapper.h" line="285">
<summary>Destroys the EncryptionParameters.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.EncryptionParameters.Finalize" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encryptionparamswrapper.h" line="290">
<summary>Destroys the EncryptionParameters.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.EncryptionParameters.GetParms" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encryptionparamswrapper.h" line="296">
<summary>Returns a reference to the underlying C++ EncryptionParameters.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.EncryptionParameters.#ctor(seal.EncryptionParameters!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encryptionparamswrapper.h" line="301">
<summary>Creates a deep copy of the C++ EncryptionParameters.</summary>
<remarks>
Creates a deep copy of a EncryptionParameters. The created EncryptionParameters 
will have the same settings as the original.
</remarks>
<param name="parms">The EncryptionParameters to copy from</param>

</member>
<member name="T:Microsoft.Research.SEAL.Plaintext" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="15">
            <summary>Class to store a plaintext element.</summary>

            <remarks>
            <para>
            Class to store a plaintext element. The data for the plaintext is a polynomial with coefficients
            modulo the plaintext modulus. The degree of the plaintext polynomial must be one less than the
            degree of the polynomial modulus. The backing array always allocates one 64-bit word per each
            coefficient of the polynoimal.
            </para>
            <para>
            SEAL allocates the memory for a plaintext by default from the global memory pool, but a user can
            alternatively specify a different memory pool to be used through the MemoryPoolHandle class. This
            can be important, as constructing or resizing several plaintexts at once allocated in the global
            memory pool can quickly lead to contention and poor performance in multi-threaded applications.
            In addition to its coefficient count, a plaintext also has a capacity which denotes the coefficient
            count that fits in the current allocation. Since each coefficient is a 64-bit word, this is exactly
            the number of 64-bit words that are allocated. In high-performance applications unnecessary
            re-allocations should also be avoided by reserving enough memory for the plaintext to begin with
            either by providing the capacity to the constructor as an extra argument, or by calling the reserve
            function at any time.
            </para>
            <para>
            In general, reading from plaintext is thread-safe as long as no other thread is concurrently
            mutating it. This is due to the underlying data structure storing the plaintext not being
            thread-safe.
            </para>
            </remarks>
            <seealso cref="T:Microsoft.Research.SEAL.Ciphertext">See Ciphertext for the class that stores ciphertexts.</seealso>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.#ctor" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="48">
<summary>Constructs an empty plaintext allocating no memory.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.#ctor(Microsoft.Research.SEAL.MemoryPoolHandle)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="53">
                <summary>Constructs an empty plaintext allocating no memory.</summary>

                <remarks>
                Constructs an empty plaintext allocating no memory. The memory pool is set to the pool pointed
                to by the given <see cref="T:Microsoft.Research.SEAL.MemoryPoolHandle"/>.
                </remarks>
                <param name="pool">The MemoryPoolHandle pointing to a valid memory pool</param>
                <exception cref="T:System.ArgumentException">if pool is uninitialized</exception>
                <exception cref="T:System.ArgumentNullException">if pool is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.#ctor(System.Int32,Microsoft.Research.SEAL.MemoryPoolHandle)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="66">
                <summary>Constructs a plaintext representing a constant polynomial 0.</summary>

                <remarks>
                Constructs a plaintext representing a constant polynomial 0. The coefficient count of the
                polynomial is set to the given value. The capacity is set to the same value. The memory
                pool is set to the pool pointed to by the given <see cref="T:Microsoft.Research.SEAL.MemoryPoolHandle"/>.
                </remarks>
                <param name="coeffCount">The number of (zeroed) coefficients in the plaintext polynomial</param>
                <param name="pool">The MemoryPoolHandle pointing to a valid memory pool</param>
                <exception cref="T:System.ArgumentException">if coeffCount is negative</exception>
                <exception cref="T:System.ArgumentException">if pool is uninitialized</exception>
                <exception cref="T:System.ArgumentNullException">if pool is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.#ctor(System.Int32)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="82">
                <summary>Constructs a plaintext representing a constant polynomial 0.</summary>

                <remarks>
                Constructs a plaintext representing a constant polynomial 0. The coefficient count of the
                polynomial is set to the given value. The capacity is set to the same value. The memory
                pool is set to the global memory pool.
                </remarks>
                <param name="coeffCount">The number of (zeroed) coefficients in the plaintext polynomial</param>
                <exception cref="T:System.ArgumentException">if coeffCount is negative</exception>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.#ctor(System.Int32,System.Int32,Microsoft.Research.SEAL.MemoryPoolHandle)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="95">
                <summary>Constructs a plaintext representing a constant polynomial 0.</summary>

                <remarks>
                Constructs a plaintext representing a constant polynomial 0. The coefficient count of 
                the polynomial and the capacity are set to the given values. The memory pool is set to the
                pool pointed to by the given <see cref="T:Microsoft.Research.SEAL.MemoryPoolHandle"/>.
                </remarks>
                <param name="capacity">The capacity</param>
                <param name="coeffCount">The number of (zeroed) coefficients in the plaintext polynomial</param>
                <param name="pool">The MemoryPoolHandle pointing to a valid memory pool</param>
                <exception cref="T:System.ArgumentException">if capacity is less than coeffCount</exception>
                <exception cref="T:System.ArgumentException">if coeffCount is negative</exception>
                <exception cref="T:System.ArgumentException">if pool is uninitialized</exception>
                <exception cref="T:System.ArgumentNullException">if pool is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.#ctor(System.Int32,System.Int32)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="113">
                <summary>Constructs a plaintext representing a constant polynomial 0.</summary>

                <remarks>
                Constructs a plaintext representing a constant polynomial 0. The coefficient count of
                the polynomial and the capacity are set to the given values. The memory pool is set to the
                global memory pool.
                </remarks>
                <param name="capacity">The capacity</param>
                <param name="coeffCount">The number of (zeroed) coefficients in the plaintext polynomial</param>
                <exception cref="T:System.ArgumentException">if capacity is less than coeffCount</exception>
                <exception cref="T:System.ArgumentException">if coeffCount is negative</exception>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.#ctor(Microsoft.Research.SEAL.BigPoly,Microsoft.Research.SEAL.MemoryPoolHandle)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="128">
<summary>Constructs a plaintext and sets its value to the polynomial represented by the given 
BigPoly.</summary>

<remarks>
Constructs a plaintext and sets its value to the polynomial represented by the given 
<see cref="T:Microsoft.Research.SEAL.BigPoly"/>. The memory pool is set to the pool pointed to by the given 
<see cref="T:Microsoft.Research.SEAL.MemoryPoolHandle"/>.
</remarks>
<param name="poly">The plaintext polynomial</param>
<param name="pool">The MemoryPoolHandle pointing to a valid memory pool</param>
<exception cref="T:System.ArgumentException">if pool is unitialized</exception>
<exception cref="T:System.ArgumentNullException">if poly or pool is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.#ctor(Microsoft.Research.SEAL.BigPoly)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="144">
                <summary>Constructs a plaintext and sets its value to the polynomial represented by the given
                BigPoly.</summary>

                <remarks>
                Constructs a plaintext and sets its value to the polynomial represented by the given
                <see cref="T:Microsoft.Research.SEAL.BigPoly"/>. The memory pool is set to the global memory pool.
                </remarks>
                <param name="poly">The plaintext polynomial</param>
                <exception cref="T:System.ArgumentNullException">if poly is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.#ctor(System.String,Microsoft.Research.SEAL.MemoryPoolHandle)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="157">
                <summary>Constructs a plaintext from a given hexadecimal string describing the plaintext polynomial.</summary>

                <remarks>
                <para>
                Constructs a plaintext from a given hexadecimal string describing the plaintext polynomial.
                The memory pool is set to the pool pointed to by the given <see cref="T:Microsoft.Research.SEAL.MemoryPoolHandle"/>.
                </para>
                <para>
                The string description of the polynomial must adhere to the format returned by <see cref="M:Microsoft.Research.SEAL.Plaintext.ToString"/>,
                which is of the form "7FFx^3 + 1x^1 + 3" and summarized by the following rules:
                <list type="number">
                <item><description>Terms are listed in order of strictly decreasing exponent</description></item>
                <item><description>Coefficient values are non-negative and in hexadecimal format (upper and lower case letters are both supported)</description></item>
                <item><description>Exponents are positive and in decimal format</description></item>
                <item><description>Zero coefficient terms (including the constant term) may be (but do not have to be) omitted</description></item>
                <item><description>Term with the exponent value of one is written as x^1</description></item>
                <item><description>Term with the exponent value of zero (the constant term) is written as just a hexadecimal number without x or exponent</description></item>
                <item><description>Terms are separated exactly by &lt;space&gt;+&lt;space&gt;</description></item>
                <item><description>Other than the +, no other terms have whitespace</description></item>
                </list>
                </para>
                </remarks>
                <param name="hexPoly">The formatted polynomial string specifying the plaintext polynomial</param>
                <param name="pool">The MemoryPoolHandle pointing to a valid memory pool</param>
                <exception cref="T:System.ArgumentException">if hexPoly does not adhere to the expected format</exception>
                <exception cref="T:System.ArgumentException">if pool is uninitialized</exception>
                <exception cref="T:System.ArgumentNullException">if hexPoly or pool is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.#ctor(System.String)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="188">
                <summary>Constructs a plaintext from a given hexadecimal string describing the plaintext polynomial.</summary>

                <remarks>
                <para>
                Constructs a plaintext from a given hexadecimal string describing the plaintext polynomial.
                The memory pool is set to the global memory pool.
                </para>
                <para>
                The string description of the polynomial must adhere to the format returned by <see cref="M:Microsoft.Research.SEAL.Plaintext.ToString"/>,
                which is of the form "7FFx^3 + 1x^1 + 3" and summarized by the following rules:
                <list type="number">
                <item><description>Terms are listed in order of strictly decreasing exponent</description></item>
                <item><description>Coefficient values are non-negative and in hexadecimal format (upper and lower case letters are both supported)</description></item>
                <item><description>Exponents are positive and in decimal format</description></item>
                <item><description>Zero coefficient terms (including the constant term) may be (but do not have to be) omitted</description></item>
                <item><description>Term with the exponent value of one is written as x^1</description></item>
                <item><description>Term with the exponent value of zero (the constant term) is written as just a hexadecimal number without x or exponent</description></item>
                <item><description>Terms are separated exactly by &lt;space&gt;+&lt;space&gt;</description></item>
                <item><description>Other than the +, no other terms have whitespace</description></item>
                </list>
                </para>
                </remarks>
                <param name="hexPoly">The formatted polynomial string specifying the plaintext polynomial</param>
                <exception cref="T:System.ArgumentException">if hexPoly does not adhere to the expected format</exception>
                <exception cref="T:System.ArgumentNullException">if hexPoly is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.#ctor(Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="217">
                <summary>Constructs a new plaintext by copying a given one.</summary>

                <param name="copy">The plaintext to copy from</param>
                <exception cref="T:System.ArgumentNullException">if copy is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.Reserve(System.Int32,Microsoft.Research.SEAL.MemoryPoolHandle)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="225">
                <summary>Allocates enough memory to accommodate the backing array of a plaintext with given capacity.</summary>

                <remarks>
                Allocates enough memory to accommodate the backing array of a plaintext with given capacity.
                The allocation is made from the memory pool pointed to by the given <see cref="T:Microsoft.Research.SEAL.MemoryPoolHandle"/>.
                </remarks>
                <param name="capacity">The capacity</param>
                <param name="pool">The MemoryPoolHandle pointing to a valid memory pool</param>
                <exception cref="T:System.ArgumentException">if capacity is negative</exception>
                <exception cref="T:System.ArgumentException">if pool is uninitialized</exception>
                <exception cref="T:System.ArgumentNullException">if pool is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.Reserve(System.Int32)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="240">
                <summary>Allocates enough memory to accommodate the backing array of a plaintext with given capacity.</summary>

                <remarks>
                Allocates enough memory to accommodate the backing array of a plaintext with given
                capacity. The allocation is made from the memory pool pointed to by the currently held
                <see cref="T:Microsoft.Research.SEAL.MemoryPoolHandle"/>. If the currently held <see cref="T:Microsoft.Research.SEAL.MemoryPoolHandle"/>
                is uninitialized, it is set to point to the global memory pool instead, and the memory 
                is allocated from the global memory pool.
                </remarks>
                <param name="capacity">The capacity</param>
                <exception cref="T:System.ArgumentException">if capacity is negative</exception>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.Release" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="255">
                <summary>Resets the plaintext.</summary>

                <remarks>
                Resets the plaintext. This function releases any memory allocated by the plaintext,
                returning it to the memory pool pointed to by the current <see cref="T:Microsoft.Research.SEAL.MemoryPoolHandle"/>.
                </remarks>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.Resize(System.Int32,Microsoft.Research.SEAL.MemoryPoolHandle)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="265">
                <summary>Resizes the plaintext to have a given coefficient count.</summary>

                <remarks>
                Resizes the plaintext to have a given coefficient count. The plaintext is automatically
                reallocated if the new coefficient count does not fit in the current capacity. The allocation 
                is made from the memory pool pointed to by the given <see cref="T:Microsoft.Research.SEAL.MemoryPoolHandle"/>. 
                </remarks>
                <param name="coeffCount">The number of coefficients in the plaintext polynomial</param>
                <param name="pool">The MemoryPoolHandle pointing to a valid memory pool</param>
                <exception cref="T:System.ArgumentException">if coeffCount is negative</exception>
                <exception cref="T:System.ArgumentException">if pool is uninitialized</exception>
                <exception cref="T:System.ArgumentNullException">if pool is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.Resize(System.Int32)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="281">
                <summary>Resizes the plaintext to have a given coefficient count.</summary>

                <remarks>
                Resizes the plaintext to have a given coefficient count. The plaintext is automatically
                reallocated if the new coefficient count does not fit in the current capacity. The allocation 
                is made from the memory pool pointed to by the currently held <see cref="T:Microsoft.Research.SEAL.MemoryPoolHandle"/>. 
                If the currently held <see cref="T:Microsoft.Research.SEAL.MemoryPoolHandle"/> is uninitialized, it is set to point 
                to the global memory pool instead, and the memory is allocated from the global memory pool. 
                </remarks>
                <param name="coeffCount">The number of coefficients in the plaintext polynomial</param>
                <exception cref="T:System.ArgumentException">if coeffCount is negative</exception>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.Set(Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="296">
                <summary>Copies a given plaintext to the current one.</summary>

                <param name="assign">The plaintext to copy from</param>
                <exception cref="T:System.ArgumentNullException">if assign is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.Set(Microsoft.Research.SEAL.BigPoly)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="304">
                <summary>Sets the value of the current plaintext to the polynomial represented by the given <see cref="T:Microsoft.Research.SEAL.BigPoly"/>.</summary>

                <param name="poly">The plaintext polynomial</param> 
                <exception cref="T:System.ArgumentException">if the coefficients of poly are too wide</exception>
                <exception cref="T:System.ArgumentNullException">if poly is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.Set(System.String)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="313">
                <summary>Sets the value of the current plaintext to the polynomial represented by the a given hexadecimal string.</summary>

                <remarks>
                <para>
                Sets the value of the current plaintext to the polynomial represented by the a given hexadecimal string.
                </para>
                <para>
                The string description of the polynomial must adhere to the format returned by <see cref="M:Microsoft.Research.SEAL.Plaintext.ToString"/>,
                which is of the form "7FFx^3 + 1x^1 + 3" and summarized by the following rules:
                <list type="number">
                <item><description>Terms are listed in order of strictly decreasing exponent</description></item>
                <item><description>Coefficient values are non-negative and in hexadecimal format (upper and lower case letters are both supported)</description></item>
                <item><description>Exponents are positive and in decimal format</description></item>
                <item><description>Zero coefficient terms (including the constant term) may be (but do not have to be) omitted</description></item>
                <item><description>Term with the exponent value of one is written as x^1</description></item>
                <item><description>Term with the exponent value of zero (the constant term) is written as just a hexadecimal number without x or exponent</description></item>
                <item><description>Terms are separated exactly by &lt;space&gt;+&lt;space&gt;</description></item>
                <item><description>Other than the +, no other terms have whitespace</description></item>
                </list>
                </para>
                </remarks>
                <param name="hexPoly">The formatted polynomial string specifying the plaintext polynomial</param>
                <exception cref="T:System.ArgumentException">if hexPoly does not adhere to the expected format</exception>
                <exception cref="T:System.ArgumentException">if the coefficients of hexPoly are too wide</exception>
                <exception cref="T:System.ArgumentNullException">if hexPoly is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.Set(System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="342">
<summary>Sets the value of the current plaintext to a given constant polynomial.</summary>

<remarks>
Sets the value of the current plaintext to a given constant polynomial. The coefficient count
is set to one.
</remarks>
<param name="constCoeff">The constant coefficient</param>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.SetZero(System.Int32,System.Int32)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="353">
                <summary>Sets a given range of coefficients of a plaintext polynomial to zero.</summary>

                <param name="startCoeff">The index of the first coefficient to set to zero</param>
                <param name="length">The number of coefficients to set to zero</param>
                <exception cref="T:System.ArgumentOutOfRangeException">if start_coeff is not within [0, CoeffCount)</exception>
                <exception cref="T:System.ArgumentOutOfRangeException">if length is negative or start_coeff + length is not within [0, CoeffCount)</exception>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.SetZero(System.Int32)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="363">
                <summary>Sets the plaintext polynomial coefficients to zero starting at a given index.</summary>

                <param name="startCoeff">The index of the first coefficient to set to zero</param>
                <exception cref="T:System.ArgumentOutOfRangeException">if start_coeff is not within [0, CoeffCount)</exception>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.SetZero" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="371">
<summary>Sets the plaintext polynomial to zero.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.Plaintext.default(System.Int32)" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="376">
                <summary>Gets/set the value of a given coefficient of the plaintext polynomial.</summary>

                <param name="coeffIndex">The index of the coefficient in the plaintext polynomial</param>
                <exception cref="T:System.ArgumentOutOfRangeException">if coeffIndex is not within [0, CoeffCount)</exception>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.Equals(Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="388">
                <summary>Returns whether or not the plaintext has the same semantic value as a given plaintext.</summary>

                <remarks>
                Returns whether or not the plaintext has the same semantic value as a given plaintext. Leading
                zero coefficients are ignored by the comparison.
                </remarks>
                <param name="compare">The plaintext to compare against</param>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.Equals(System.Object)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="399">
                <summary>Returns whether or not the plaintext has the same semantic value as a given plaintext.</summary>

                <remarks>
                Returns whether or not the plaintext has the same semantic value as a given plaintext. Leading
                zero coefficients are ignored by the comparison.
                </remarks>
                <param name="compare">The plaintext to compare against</param>

</member>
<member name="P:Microsoft.Research.SEAL.Plaintext.IsZero" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="410">
<summary>Returns whether the plaintext polynomial has all zero coefficients.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.Plaintext.Capacity" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="417">
<summary>Returns the capacity of the current allocation.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.Plaintext.CoeffCount" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="424">
<summary>Returns the coefficient count of the current plaintext polynomial.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.SignificantCoeffCount" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="431">
<summary>Returns the significant coefficient count of the current plaintext polynomial.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.ToString" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="436">
<summary>Returns a human-readable string description of the plaintext polynomial.</summary>
<remarks>
<para>
Returns a human-readable string description of the plaintext polynomial.
</para>
<para>
The returned string is of the form "7FFx^3 + 1x^1 + 3" with a format summarized by the following:
<list type="number">
<item><description>Terms are listed in order of strictly decreasing exponent</description></item>
<item><description>Coefficient values are non-negative and in hexadecimal format (hexadecimal letters are in upper-case)</description></item>
<item><description>Exponents are positive and in decimal format</description></item>
<item><description>Zero coefficient terms (including the constant term) are omitted unless the polynomial is exactly 0 (see rule 9)</description></item>
<item><description>Term with the exponent value of one is written as x^1</description></item>
<item><description>Term with the exponent value of zero (the constant term) is written as just a hexadecimal number without x or exponent</description></item>
<item><description>Terms are separated exactly by &lt;space&gt;+&lt;space&gt;</description></item>
<item><description>Other than the +, no other terms have whitespace</description></item>
<item><description>If the polynomial is exactly 0, the string "0" is returned</description></item>
</list>
</para>
</remarks>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.GetHashCode" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="460">
<summary>Returns a hash-code based on the value of the plaintext polynomial.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.Save(System.IO.Stream)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="465">
<summary>Saves the plaintext to an output stream.</summary>

<remarks>
Saves the plaintext to an output stream. The output is in binary format and not human-readable. 
The output stream must have the "binary" flag set.
</remarks>
<param name="stream">The stream to save the plaintext to</param>
<exception cref="T:System.ArgumentNullException">if stream is null</exception>
<seealso cref="M:Microsoft.Research.SEAL.Plaintext.Load(System.IO.Stream)">See Load() to load a saved plaintext.</seealso>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.Load(System.IO.Stream)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="478">
                <summary>Loads a plaintext from an input stream overwriting the current plaintext.</summary>

                <param name="stream">The stream to load the plaintext from</param>
                <exception cref="T:System.ArgumentNullException">if stream is null</exception>
                <seealso cref="M:Microsoft.Research.SEAL.Plaintext.Save(System.IO.Stream)">See Save() to save a plaintext.</seealso>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.Pool" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="487">
<summary>Returns a copy of the MemoryPoolHandle.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.Dispose" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="492">
<summary>Destroys the plaintext.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.Finalize" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="497">
<summary>Destroys the plaintext.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.#ctor(seal.Plaintext!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="503">
<summary>Creates a deep copy of a C++ Plaintext instance.</summary>
<param name="value">The Plaintext instance to copy from</param>
<exception cref="T:System.ArgumentNullException">If copy is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.Plaintext.GetPlaintext" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\plaintextwrapper.h" line="510">
<summary>Returns a reference to the underlying C++ Plaintext.</summary>

</member>
<!-- Discarding badly formed XML document comment for member 'T:Microsoft.Research.SEAL.BinaryEncoder'. -->
<member name="M:Microsoft.Research.SEAL.BinaryEncoder.#ctor(Microsoft.Research.SEAL.SmallModulus)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="57">
<summary>Creates a BinaryEncoder object.</summary>
<remarks>
Creates a BinaryEncoder object. The constructor takes as input a reference to the plaintext modulus 
(represented by <see cref="T:Microsoft.Research.SEAL.BigUInt"/>).
</remarks>
<param name="plainModulus">The plaintext modulus (represented by <see cref="T:Microsoft.Research.SEAL.SmallModulus"/>)</param>
<exception cref="T:System.ArgumentNullException">if plainModulus is null</exception>
<exception cref="T:System.ArgumentException">if plainModulus is not at least 2</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BinaryEncoder.#ctor(Microsoft.Research.SEAL.BinaryEncoder)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="69">
                <summary>Creates a copy of a BinaryEncoder.</summary>

                <param name="copy">The BinaryEncoder to copy from</param>
                <exception cref="T:System.ArgumentNullException">if copy is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BinaryEncoder.Dispose" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="77">
<summary>Destroys the BinaryEncoder.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.BinaryEncoder.Finalize" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="82">
<summary>Destroys the BinaryEncoder.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.BinaryEncoder.PlainModulus" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="87">
<summary>Returns a reference to the plaintext modulus.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.BinaryEncoder.Base" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="95">
<summary>Returns the base used for encoding (2).</summary>

</member>
<member name="M:Microsoft.Research.SEAL.BinaryEncoder.Encode(System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="103">
<summary>Encodes an unsigned integer (represented by System::UInt64) into a plaintext polynomial.</summary>
<param name="value">The unsigned integer to encode</param>

</member>
<member name="M:Microsoft.Research.SEAL.BinaryEncoder.Encode(System.UInt64,Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="109">
<summary>Encodes an unsigned integer (represented by System::UInt64) into a plaintext polynomial.</summary>
<param name="value">The unsigned integer to encode</param>
<param name="destination">The plaintext to overwrite with the encoding</param>
<exception cref="T:System.ArgumentNullException">if destination is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BinaryEncoder.Encode(Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="117">
<summary>Encodes an unsigned integer (represented by <see cref="T:Microsoft.Research.SEAL.BigUInt"/>) into a plaintext polynomial.</summary>
<param name="value">The unsigned integer to encode</param>
<exception cref="T:System.ArgumentNullException">if value is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BinaryEncoder.Encode(Microsoft.Research.SEAL.BigUInt,Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="124">
<summary>Encodes an unsigned integer (represented by <see cref="T:Microsoft.Research.SEAL.BigUInt"/>) into a plaintext polynomial.</summary>
<param name="value">The unsigned integer to encode</param>
<param name="destination">The plaintext to overwrite with the encoding</param>
<exception cref="T:System.ArgumentNullException">if value or destination is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BinaryEncoder.Encode(System.Int64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="132">
<summary>Encodes a signed integer (represented by System::Int64) into a plaintext polynomial.</summary>
<remarks>
<para>
Encodes a signed integer (represented by System::Int64) into a plaintext polynomial.
</para>
<para>
Negative integers are represented by using -1 instead of 1 in the binary representation, and the negative coefficients
are stored in the plaintext polynomials as unsigned integers that represent them modulo the plaintext modulus. Thus,
for example, a coefficient of -1 would be stored as a polynomial coefficient plainModulus-1.
</para>
</remarks>
<param name="value">The signed integer to encode</param>

</member>
<member name="M:Microsoft.Research.SEAL.BinaryEncoder.Encode(System.Int64,Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="148">
<summary>Encodes a signed integer (represented by System::Int64) into a plaintext polynomial.</summary>
<remarks>
<para>
Encodes a signed integer (represented by System::Int64) into a plaintext polynomial.
</para>
<para>
Negative integers are represented by using -1 instead of 1 in the binary representation, and the negative coefficients
are stored in the plaintext polynomials as unsigned integers that represent them modulo the plaintext modulus. Thus,
for example, a coefficient of -1 would be stored as a polynomial coefficient plainModulus-1.
</para>
</remarks>
<param name="value">The signed integer to encode</param>
<param name="destination">The plaintext to overwrite with the encoding</param>
<exception cref="T:System.ArgumentNullException">if destination is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BinaryEncoder.DecodeUInt64(Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="166">
<summary>Decodes a plaintext polynomial and returns the result as System::UInt64.</summary>
<remarks>
Decodes a plaintext polynomial and returns the result as System::UInt64. Mathematically this amounts to evaluating the
input polynomial at X=2.
</remarks>
<param name="plain">The plaintext to be decoded</param>
<exception cref="T:System.ArgumentNullException">if plain is null</exception>
<exception cref="T:System.ArgumentException">if the output does not fit in System::UInt64 (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BinaryEncoder.DecodeUInt32(Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="178">
<summary>Decodes a plaintext polynomial and returns the result as System::UInt32.</summary>
<remarks>
Decodes a plaintext polynomial and returns the result as System::UInt32. Mathematically this amounts to evaluating the
input polynomial at X=2.
</remarks>
<param name="plain">The plaintext to be decoded</param>
<exception cref="T:System.ArgumentNullException">if plain is null</exception>
<exception cref="T:System.ArgumentException">if the output does not fit in System::UInt32 (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BinaryEncoder.DecodeInt64(Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="190">
<summary>Decodes a plaintext polynomial and returns the result as System::Int64.</summary>
<remarks>
Decodes a plaintext polynomial and returns the result as System::Int64. Mathematically this amounts to evaluating the
input polynomial at X=2.
</remarks>
<param name="plain">The plaintext to be decoded</param>
<exception cref="T:System.ArgumentNullException">if plain is null</exception>
<exception cref="T:System.ArgumentException">if plain does not represent a valid plaintext polynomial</exception>
<exception cref="T:System.ArgumentException">if the output does not fit in System::Int64 (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BinaryEncoder.DecodeInt32(Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="203">
<summary>Decodes a plaintext polynomial and returns the result as System::Int32.</summary>
<remarks>
Decodes a plaintext polynomial and returns the result as System::Int32. Mathematically this amounts to evaluating the
input polynomial at X=2.
</remarks>
<param name="plain">The plaintext to be decoded</param>
<exception cref="T:System.ArgumentNullException">if plain is null</exception>
<exception cref="T:System.ArgumentException">if plain does not represent a valid plaintext polynomial</exception>
<exception cref="T:System.ArgumentException">if the output does not fit in System::Int32 (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BinaryEncoder.DecodeBigUInt(Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="216">
<summary>Decodes a plaintext polynomial and returns the result as BigUInt.</summary>
<remarks>
Decodes a plaintext polynomial and returns the result as <see cref="T:Microsoft.Research.SEAL.BigUInt"/>. Mathematically this amounts to evaluating the input
polynomial at X=2.
</remarks>
<param name="plain">The plaintext to be decoded</param>
<exception cref="T:System.ArgumentNullException">if plain is null</exception>
<exception cref="T:System.ArgumentException">if plain does not represent a valid plaintext polynomial</exception>
<exception cref="T:System.ArgumentException">if the output is negative (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BinaryEncoder.DecodeBigUInt(Microsoft.Research.SEAL.Plaintext,Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="229">
<summary>Decodes a plaintext polynomial and stores the result in a given BigUInt.</summary>
<remarks>
Decodes a plaintext polynomial and stores the result in a given <see cref="T:Microsoft.Research.SEAL.BigUInt"/>. Mathematically this amounts to evaluating the
input polynomial at X=2.
</remarks>
<param name="plain">The plaintext to be decoded</param>
<param name="destination">The BigUInt to overwrite with the decoding</param>
<exception cref="T:System.ArgumentNullException">if plain or destination is null</exception>
<exception cref="T:System.ArgumentException">if plain does not represent a valid plaintext polynomial</exception>
<exception cref="T:System.ArgumentException">if the output does not fit in destination</exception>
<exception cref="T:System.ArgumentException">if the output is negative (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BinaryEncoder.Encode(System.Int32)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="244">
<summary>Encodes a signed integer (represented by System::Int32) into a plaintext polynomial.</summary>
<remarks>
<para>
Encodes a signed integer (represented by System::Int32) into a plaintext polynomial.
</para>
<para>
Negative integers are represented by using -1 instead of 1 in the binary representation, and the negative coefficients
are stored in the plaintext polynomials as unsigned integers that represent them modulo the plaintext modulus. Thus,
for example, a coefficient of -1 would be stored as a polynomial coefficient plainModulus-1.
</para>
</remarks>
<param name="value">The signed integer to encode</param>

</member>
<member name="M:Microsoft.Research.SEAL.BinaryEncoder.Encode(System.UInt32)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="260">
<summary>Encodes an unsigned integer (represented by System::UInt32) into a plaintext polynomial.</summary>
<param name="value">The unsigned integer to encode</param>

</member>
<member name="M:Microsoft.Research.SEAL.BinaryEncoder.Encode(System.Int32,Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="266">
<summary>Encodes a signed integer (represented by System::Int32) into a plaintext polynomial.</summary>
<remarks>
<para>
Encodes a signed integer (represented by System::Int32) into a plaintext polynomial.
</para>
<para>
Negative integers are represented by using -1 instead of 1 in the binary representation, and the negative coefficients
are stored in the plaintext polynomials as unsigned integers that represent them modulo the plaintext modulus. Thus,
for example, a coefficient of -1 would be stored as a polynomial coefficient plainModulus-1.
</para>
</remarks>
<param name="value">The signed integer to encode</param>
<param name="destination">The plaintext to overwrite with the encoding</param>
<exception cref="T:System.ArgumentNullException">if destination is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BinaryEncoder.Encode(System.UInt32,Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="284">
<summary>Encodes an unsigned integer (represented by System::UInt32) into a plaintext polynomial.</summary>
<param name="value">The unsigned integer to encode</param>
<param name="destination">The plaintext to overwrite with the encoding</param>
<exception cref="T:System.ArgumentNullException">if destination is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BinaryEncoder.GetEncoder" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="293">
<summary>Returns a reference to the underlying C++ BinaryEncoder.</summary>

</member>
<!-- Discarding badly formed XML document comment for member 'T:Microsoft.Research.SEAL.BalancedEncoder'. -->
<member name="M:Microsoft.Research.SEAL.BalancedEncoder.#ctor(Microsoft.Research.SEAL.SmallModulus)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="348">
<summary>Creates a BalancedEncoder object.</summary>
<remarks>
Creates a BalancedEncoder object with base set to 3. The constructor takes as input a reference to the 
plaintext modulus (represented by <see cref="T:Microsoft.Research.SEAL.SmallModulus"/>).
</remarks>
<param name="plainModulus">The plaintext modulus (represented by <see cref="T:Microsoft.Research.SEAL.SmallModulus"/>)</param>
<exception cref="T:System.ArgumentNullException">if plainModulus is null</exception>
<exception cref="T:System.ArgumentException">if plainModulus is not at least 2</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedEncoder.#ctor(Microsoft.Research.SEAL.SmallModulus,System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="360">
<summary>Creates a BalancedEncoder object.</summary>
<remarks>
Creates a BalancedEncoder object. The constructor takes as input a reference to the plaintext modulus 
(represented by <see cref="T:Microsoft.Research.SEAL.SmallModulus"/>), and an integer, at least 3, that is used as a base 
in the encoding.
</remarks>
<param name="plainModulus">The plaintext modulus (represented by <see cref="T:Microsoft.Research.SEAL.SmallModulus"/>)</param>
<param name="base">The base to be used for encoding</param>
<exception cref="T:System.ArgumentNullException">if plainModulus is null</exception>
<exception cref="T:System.ArgumentException">if base is not an integer and at least 3</exception>
<exception cref="T:System.ArgumentException">if plainModulus is not at least base</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedEncoder.#ctor(Microsoft.Research.SEAL.SmallModulus,System.UInt64,Microsoft.Research.SEAL.MemoryPoolHandle)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="375">
<summary>Creates a BalancedEncoder object.</summary>
<remarks>
Creates a BalancedEncoder object. The constructor takes as input a reference to the plaintext modulus
(represented by <see cref="T:Microsoft.Research.SEAL.SmallModulus"/>), and an integer, at least 3, that is used as a base
in the encoding. The user can give a <see cref="T:Microsoft.Research.SEAL.MemoryPoolHandle"/> object to use a custom
memory pool instead of the global memory pool (default).
</remarks>
<param name="plainModulus">The plaintext modulus (represented by <see cref="T:Microsoft.Research.SEAL.SmallModulus"/>)</param>
<param name="base">The base to be used for encoding</param>
<exception cref="T:System.ArgumentNullException">if plainModulus or pool is null</exception>
<exception cref="T:System.ArgumentException">if base is not an integer and at least 3</exception>
<exception cref="T:System.ArgumentException">if plainModulus is not at least base</exception>
<seealso cref="T:Microsoft.Research.SEAL.MemoryPoolHandle">See MemoryPoolHandle for more details on memory pool handles.</seealso>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedEncoder.#ctor(Microsoft.Research.SEAL.BalancedEncoder)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="392">
                <summary>Creates a copy of a BalancedEncoder.</summary>

                <param name="copy">The BalancedEncoder to copy from</param>
                <exception cref="T:System.ArgumentNullException">if copy is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedEncoder.Dispose" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="400">
<summary>Destroys the BalancedEncoder.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedEncoder.Finalize" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="405">
<summary>Destroys the BalancedEncoder.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.BalancedEncoder.PlainModulus" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="410">
<summary>Returns a reference to the plaintext modulus.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.BalancedEncoder.Base" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="418">
<summary>Returns the base used for encoding.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedEncoder.Encode(System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="426">
<summary>Encodes an unsigned integer (represented by System::UInt64) into a plaintext polynomial.</summary>
<param name="value">The unsigned integer to encode</param>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedEncoder.Encode(System.UInt64,Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="432">
<summary>Encodes an unsigned integer (represented by System::UInt64) into a plaintext polynomial.</summary>
<param name="value">The unsigned integer to encode</param>
<param name="destination">The plaintext to overwrite with the encoding</param>
<exception cref="T:System.ArgumentNullException">if destination is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedEncoder.Encode(Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="440">
<summary>Encodes an unsigned integer (represented by <see cref="T:Microsoft.Research.SEAL.BigUInt"/>) into a plaintext polynomial.</summary>
<param name="value">The unsigned integer to encode</param>
<exception cref="T:System.ArgumentNullException">if value is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedEncoder.Encode(Microsoft.Research.SEAL.BigUInt,Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="447">
<summary>Encodes an unsigned integer (represented by <see cref="T:Microsoft.Research.SEAL.BigUInt"/>) into a plaintext polynomial.</summary>
<param name="value">The unsigned integer to encode</param>
<param name="destination">The plaintext to overwrite with the encoding</param>
<exception cref="T:System.ArgumentNullException">if value or destination is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedEncoder.Encode(System.Int64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="455">
<summary>Encodes a signed integer (represented by System::Int64) into a plaintext polynomial.</summary>
<remarks>
<para>
Encodes a signed integer (represented by System::Int64) into a plaintext polynomial.
</para>
<para>
Negative integers in the balanced base-b encoding are represented the same way as positive integers, namely, both
positive and negative integers can have both positive and negative digits in their balanced base-b representation.
Negative coefficients are stored in the plaintext polynomials as unsigned integers that represent them modulo the
plaintext modulus. Thus, for example, a coefficient of -1 would be stored as a polynomial coefficient plainModulus-1.
</para>
</remarks>
<param name="value">The signed integer to encode</param>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedEncoder.Encode(System.Int64,Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="472">
<summary>Encodes a signed integer (represented by System::Int64) into a plaintext polynomial.</summary>
<remarks>
<para>
Encodes a signed integer (represented by System::Int64) into a plaintext polynomial.
</para>
<para>
Negative integers in the balanced base-b encoding are represented the same way as positive integers, namely, both
positive and negative integers can have both positive and negative digits in their balanced base-b representation.
Negative coefficients are stored in the plaintext polynomials as unsigned integers that represent them modulo the
plaintext modulus. Thus, for example, a coefficient of -1 would be stored as a polynomial coefficient plainModulus-1.
</para>
</remarks>
<param name="value">The signed integer to encode</param>
<param name="destination">The plaintext to overwrite with the encoding</param>
<exception cref="T:System.ArgumentNullException">if destination is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedEncoder.DecodeUInt64(Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="491">
<summary>Decodes a plaintext polynomial and returns the result as System::UInt64.</summary>
<remarks>
Decodes a plaintext polynomial and returns the result as System::UInt64. Mathematically this amounts to evaluating the
input polynomial at X=base.
</remarks>
<param name="plain">The plaintext to be decoded</param>
<exception cref="T:System.ArgumentNullException">if plain is null</exception>
<exception cref="T:System.ArgumentException">if plain does not represent a valid plaintext polynomial</exception>
<exception cref="T:System.ArgumentException">if the output does not fit in System::UInt64 (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedEncoder.DecodeUInt32(Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="504">
<summary>Decodes a plaintext polynomial and returns the result as System::UInt32.</summary>
<remarks>
Decodes a plaintext polynomial and returns the result as System::UInt32. Mathematically this amounts to evaluating the
input polynomial at X=base.
</remarks>
<param name="plain">The plaintext to be decoded</param>
<exception cref="T:System.ArgumentNullException">if plain is null</exception>
<exception cref="T:System.ArgumentException">if plain does not represent a valid plaintext polynomial</exception>
<exception cref="T:System.ArgumentException">if the output does not fit in System::UInt32 (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedEncoder.DecodeInt64(Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="517">
<summary>Decodes a plaintext polynomial and returns the result as System::Int64.</summary>
<remarks>
Decodes a plaintext polynomial and returns the result as System::Int64. Mathematically this amounts to evaluating the
input polynomial at X=base.
</remarks>
<param name="plain">The plaintext to be decoded</param>
<exception cref="T:System.ArgumentNullException">if plain is null</exception>
<exception cref="T:System.ArgumentException">if plain does not represent a valid plaintext polynomial</exception>
<exception cref="T:System.ArgumentException">if the output does not fit in System::Int64 (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedEncoder.DecodeInt32(Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="530">
<summary>Decodes a plaintext polynomial and returns the result as System::Int32.</summary>
<remarks>
Decodes a plaintext polynomial and returns the result as System::Int32. Mathematically this amounts to evaluating the
input polynomial at X=base.
</remarks>
<param name="plain">The plaintext to be decoded</param>
<exception cref="T:System.ArgumentNullException">if plain is null</exception>
<exception cref="T:System.ArgumentException">if plain does not represent a valid plaintext polynomial</exception>
<exception cref="T:System.ArgumentException">if the output does not fit in System::Int32 (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedEncoder.DecodeBigUInt(Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="543">
<summary>Decodes a plaintext polynomial and returns the result as BigUInt.</summary>
<remarks>
Decodes a plaintext polynomial and returns the result as <see cref="T:Microsoft.Research.SEAL.BigUInt"/>. Mathematically this amounts to evaluating the input
polynomial at X=base.
</remarks>
<param name="plain">The plaintext to be decoded</param>
<exception cref="T:System.ArgumentNullException">if plain is null</exception>
<exception cref="T:System.ArgumentException">if plain does not represent a valid plaintext polynomial</exception>
<exception cref="T:System.ArgumentException">if the output is negative (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedEncoder.DecodeBigUInt(Microsoft.Research.SEAL.Plaintext,Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="556">
<summary>Decodes a plaintext polynomial and stores the result in a given BigUInt.</summary>
<remarks>
Decodes a plaintext polynomial and stores the result in a given <see cref="T:Microsoft.Research.SEAL.BigUInt"/>. Mathematically this amounts to evaluating the
input polynomial at X=base.
</remarks>
<param name="plain">The plaintext to be decoded</param>
<param name="destination">The BigUInt to overwrite with the decoding</param>
<exception cref="T:System.ArgumentNullException">if plain or destination is null</exception>
<exception cref="T:System.ArgumentException">if plain does not represent a valid plaintext polynomial</exception>
<exception cref="T:System.ArgumentException">if the output does not fit in destination</exception>
<exception cref="T:System.ArgumentException">if the output is negative (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedEncoder.Encode(System.Int32)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="571">
<summary>Encodes a signed integer (represented by System::Int32) into a plaintext polynomial.</summary>
<remarks>
<para>
Encodes a signed integer (represented by System::Int32) into a plaintext polynomial.
</para>
<para>
Negative integers in the balanced base-b encoding are represented the same way as positive integers, namely, both
positive and negative integers can have both positive and negative digits in their balanced base-b representation.
Negative coefficients are stored in the plaintext polynomials as unsigned integers that represent them modulo the
plaintext modulus. Thus, for example, a coefficient of -1 would be stored as a polynomial coefficient plainModulus-1.
</para>
</remarks>
<param name="value">The signed integer to encode</param>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedEncoder.Encode(System.UInt32)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="588">
<summary>Encodes an unsigned integer (represented by System::UInt32) into a plaintext polynomial.</summary>
<param name="value">The unsigned integer to encode</param>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedEncoder.Encode(System.Int32,Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="594">
<summary>Encodes a signed integer (represented by System::Int32) into a plaintext polynomial.</summary>
<remarks>
<para>
Encodes a signed integer (represented by System::Int32) into a plaintext polynomial.
</para>
<para>
Negative integers in the balanced base-b encoding are represented the same way as positive integers, namely, both
positive and negative integers can have both positive and negative digits in their balanced base-b representation.
Negative coefficients are stored in the plaintext polynomials as unsigned integers that represent them modulo the
plaintext modulus. Thus, for example, a coefficient of -1 would be stored as a polynomial coefficient plainModulus-1.
</para>
</remarks>
<param name="value">The signed integer to encode</param>
<param name="destination">The plaintext to overwrite with the encoding</param>
<exception cref="T:System.ArgumentNullException">if destination is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedEncoder.Encode(System.UInt32,Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="613">
<summary>Encodes an unsigned integer (represented by System::UInt32) into a plaintext polynomial.</summary>
<param name="value">The unsigned integer to encode</param>
<param name="destination">The plaintext to overwrite with the encoding</param>
<exception cref="T:System.ArgumentNullException">if destination is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedEncoder.GetEncoder" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="622">
<summary>Returns a reference to the underlying C++ BalancedEncoder.</summary>

</member>
<!-- Discarding badly formed XML document comment for member 'T:Microsoft.Research.SEAL.BinaryFractionalEncoder'. -->
<member name="M:Microsoft.Research.SEAL.BinaryFractionalEncoder.#ctor(Microsoft.Research.SEAL.SmallModulus,Microsoft.Research.SEAL.BigPoly,System.Int32,System.Int32)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="681">
<summary>Creates a new BinaryFractionalEncoder object.</summary>
<remarks>
Creates a new BinaryFractionalEncoder object. The constructor takes as input a reference to the plaintext modulus,
a reference to the polynomial modulus, and the numbers of coefficients that are reserved for
the integral and fractional parts. The coefficients for the integral part are counted starting from the low-degree end
of the polynomial, and the coefficients for the fractional part are counted from the high-degree end.
</remarks>
<param name="plainModulus">The plaintext modulus (represented by <see cref="T:Microsoft.Research.SEAL.SmallModulus"/>)</param>
<param name="polyModulus">The polynomial modulus (represented by <see cref="T:Microsoft.Research.SEAL.BigPoly"/>)</param>
<param name="integerCoeffCount">The number of polynomial coefficients reserved for the integral part</param>
<param name="fractionCoeffCount">The number of polynomial coefficients reserved for the fractional part</param>
<exception cref="T:System.ArgumentNullException">if plainModulus or polyModulus is null</exception>
<exception cref="T:System.ArgumentException">if plainModulus is not at least 2</exception>
<exception cref="T:System.ArgumentException">if integerCoeffCount is not strictly positive</exception>
<exception cref="T:System.ArgumentException">if fractionCoeffCount is not strictly positive</exception>
<exception cref="T:System.ArgumentException">if polyModulus is zero</exception>
<exception cref="T:System.ArgumentException">if polyModulus is too small for the integral and fractional
parts</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BinaryFractionalEncoder.#ctor(Microsoft.Research.SEAL.BinaryFractionalEncoder)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="703">
                <summary>Creates a copy of a BinaryFractionalEncoder.</summary>

                <param name="copy">The BinaryFractionalEncoder to copy from</param>
                <exception cref="T:System.ArgumentNullException">if copy is null</exception>

</member>
<!-- Discarding badly formed XML document comment for member 'M:Microsoft.Research.SEAL.BinaryFractionalEncoder.Dispose'. -->
<!-- Discarding badly formed XML document comment for member 'M:Microsoft.Research.SEAL.BinaryFractionalEncoder.Finalize'. -->
<member name="M:Microsoft.Research.SEAL.BinaryFractionalEncoder.Encode(System.Double)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="721">
<summary>Encodes a double precision floating point number into a plaintext polynomial.</summary>
<param name="value">The double-precision floating-point number to encode</param>

</member>
<member name="M:Microsoft.Research.SEAL.BinaryFractionalEncoder.Decode(Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="727">
<summary>Decodes a plaintext polynomial and returns the result as a double-precision floating-point number.</summary>
<param name="plain">The plaintext to be decoded</param>
<exception cref="T:System.ArgumentNullException">if plain is null</exception>
<exception cref="T:System.ArgumentException">if plain does not represent a valid plaintext polynomial</exception>
<exception cref="T:System.ArgumentException">if the integral part does not fit in System::Int64 (#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)</exception>

</member>
<member name="P:Microsoft.Research.SEAL.BinaryFractionalEncoder.PlainModulus" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="736">
<summary>Returns a reference to the plaintext modulus.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.BinaryFractionalEncoder.PolyModulus" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="744">
<summary>Returns a reference to the polynomial modulus.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.BinaryFractionalEncoder.FractionCoeffCount" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="752">
<summary>Returns the number of coefficients reserved for the fractional part.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.BinaryFractionalEncoder.IntegerCoeffCount" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="760">
<summary>Returns the number of coefficients reserved for the integral part.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.BinaryFractionalEncoder.Base" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="768">
<summary>Returns the base used for encoding (2).</summary>

</member>
<member name="M:Microsoft.Research.SEAL.BinaryFractionalEncoder.GetEncoder" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="777">
<summary>Returns a reference to the underlying C++ BinaryFractionalEncoder.</summary>

</member>
<!-- Discarding badly formed XML document comment for member 'T:Microsoft.Research.SEAL.BalancedFractionalEncoder'. -->
<member name="M:Microsoft.Research.SEAL.BalancedFractionalEncoder.#ctor(Microsoft.Research.SEAL.SmallModulus,Microsoft.Research.SEAL.BigPoly,System.Int32,System.Int32)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="837">
<summary>Creates a new BalancedFractionalEncoder object.</summary>
<remarks>
Creates a new BalancedFractionalEncoder object. The constructor takes as input a reference to the plaintext modulus,
a reference to the polynomial modulus, and the numbers of coefficients that are reserved for
the integral and fractional parts. The base used for encoding is taken to be 3.
The coefficients for the integral part are counted starting from the low-degree end of the polynomial, and the
coefficients for the fractional part are counted from the high-degree end.
</remarks>
<param name="plainModulus">The plaintext modulus (represented by <see cref="T:Microsoft.Research.SEAL.SmallModulus"/>)</param>
<param name="polyModulus">The polynomial modulus (represented by <see cref="T:Microsoft.Research.SEAL.BigPoly"/>)</param>
<param name="integerCoeffCount">The number of polynomial coefficients reserved for the integral part</param>
<param name="fractionCoeffCount">The number of polynomial coefficients reserved for the fractional part</param>
<exception cref="T:System.ArgumentNullException">if plainModulus or polyModulus is null</exception>
<exception cref="T:System.ArgumentException">if plainModulus is not at least 2</exception>
<exception cref="T:System.ArgumentException">if integerCoeffCount is not strictly positive</exception>
<exception cref="T:System.ArgumentException">if fractionCoeffCount is not strictly positive</exception>
<exception cref="T:System.ArgumentException">if polyModulus is zero</exception>
<exception cref="T:System.ArgumentException">if polyModulus is too small for the integral and fractional
parts</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedFractionalEncoder.#ctor(Microsoft.Research.SEAL.SmallModulus,Microsoft.Research.SEAL.BigPoly,System.Int32,System.Int32,System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="860">
<summary>Creates a new BalancedFractionalEncoder object.</summary>
<remarks>
Creates a new BalancedFractionalEncoder object. The constructor takes as input a reference to the plaintext modulus,
a reference to the polynomial modulus, and the numbers of coefficients that are reserved for
the integral and fractional parts, and an odd integer, at least 3, that is used as the base in the encoding.
The coefficients for the integral part are counted starting from the low-degree end of the polynomial, and the
coefficients for the fractional part are counted from the high-degree end.
</remarks>
<param name="plainModulus">The plaintext modulus (represented by <see cref="T:Microsoft.Research.SEAL.SmallModulus"/>)</param>
<param name="polyModulus">The polynomial modulus (represented by <see cref="T:Microsoft.Research.SEAL.BigPoly"/>)</param>
<param name="integerCoeffCount">The number of polynomial coefficients reserved for the integral part</param>
<param name="fractionCoeffCount">The number of polynomial coefficients reserved for the fractional part</param>
<param name="base">The base to be used for encoding</param>
<exception cref="T:System.ArgumentNullException">if plainModulus or polyModulus is null</exception>
<exception cref="T:System.ArgumentException">if plainModulus is not at least (base + 1) / 2</exception>
<exception cref="T:System.ArgumentException">if integerCoeffCount is not strictly positive</exception>
<exception cref="T:System.ArgumentException">if fractionCoeffCount is not strictly positive</exception>
<exception cref="T:System.ArgumentException">if polyModulus is zero</exception>
<exception cref="T:System.ArgumentException">if polyModulus is too small for the integral and fractional
parts</exception>
<exception cref="T:System.ArgumentException">if base is not an odd integer and at least 3</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedFractionalEncoder.#ctor(Microsoft.Research.SEAL.BalancedFractionalEncoder)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="886">
                <summary>Creates a copy of a BalancedFractionalEncoder.</summary>

                <param name="copy">The BalancedFractionalEncoder to copy from</param>
                <exception cref="T:System.ArgumentNullException">if copy is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedFractionalEncoder.Dispose" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="894">
<summary>Destroys the BalancedFractionalEncoder.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedFractionalEncoder.Finalize" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="899">
<summary>Destroys the BalancedFractionalEncoder.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedFractionalEncoder.Encode(System.Double)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="904">
<summary>Encodes a double precision floating point number into a plaintext polynomial.</summary>
<param name="value">The double-precision floating-point number to encode</param>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedFractionalEncoder.Decode(Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="910">
<summary>Decodes a plaintext polynomial and returns the result as a double-precision floating-point number.</summary>
<param name="plain">The plaintext to be decoded</param>
<exception cref="T:System.ArgumentNullException">if plain is null</exception>
<exception cref="T:System.ArgumentException">if plain does not represent a valid plaintext polynomial</exception>
<exception cref="T:System.ArgumentException">if either the integral part does not fit in System::Int64 
(#ifdef SEAL_THROW_ON_DECODER_OVERFLOW)</exception>

</member>
<member name="P:Microsoft.Research.SEAL.BalancedFractionalEncoder.PlainModulus" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="920">
<summary>Returns a reference to the plaintext modulus.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.BalancedFractionalEncoder.PolyModulus" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="928">
<summary>Returns a reference to the polynomial modulus.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.BalancedFractionalEncoder.FractionCoeffCount" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="936">
<summary>Returns the number of coefficients reserved for the fractional part.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.BalancedFractionalEncoder.IntegerCoeffCount" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="944">
<summary>Returns the number of coefficients reserved for the integral part.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.BalancedFractionalEncoder.Base" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="952">
<summary>Returns the base used for encoding.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.BalancedFractionalEncoder.GetEncoder" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="961">
<summary>Returns a reference to the underlying C++ BalancedFractionalEncoder.</summary>

</member>
<!-- Discarding badly formed XML document comment for member 'T:Microsoft.Research.SEAL.IntegerEncoder'. -->
<member name="M:Microsoft.Research.SEAL.IntegerEncoder.#ctor(Microsoft.Research.SEAL.SmallModulus)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1022">
<summary>Creates an IntegerEncoder object.</summary>
<remarks>
Creates an IntegerEncoder object with base set to 2. The constructor takes as input a reference to the 
plaintext modulus (represented by <see cref="T:Microsoft.Research.SEAL.SmallModulus"/>).
</remarks>
<param name="plainModulus">The plaintext modulus (represented by <see cref="T:Microsoft.Research.SEAL.SmallModulus"/>)</param>
<exception cref="T:System.ArgumentNullException">if plainModulus is null</exception>
<exception cref="T:System.ArgumentException">if plainModulus is not at least 2</exception>

</member>
<member name="M:Microsoft.Research.SEAL.IntegerEncoder.#ctor(Microsoft.Research.SEAL.SmallModulus,System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1034">
<summary>Creates an IntegerEncoder object.</summary>
<remarks>
Creates an IntegerEncoder object. The constructor takes as input a reference to the plaintext modulus 
(represented by <see cref="T:Microsoft.Research.SEAL.SmallModulus"/>), and an integer, at least 2, that is used as a base in the encoding.
</remarks>
<param name="plainModulus">The plaintext modulus (represented by <see cref="T:Microsoft.Research.SEAL.SmallModulus"/>)</param>
<param name="base">The base to be used for encoding (default value is 2)</param>
<exception cref="T:System.ArgumentNullException">if plainModulus is null</exception>
<exception cref="T:System.ArgumentException">if base is not an integer and at least 2</exception>
<exception cref="T:System.ArgumentException">if plainModulus is not at least base</exception>

</member>
<member name="M:Microsoft.Research.SEAL.IntegerEncoder.#ctor(Microsoft.Research.SEAL.IntegerEncoder)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1048">
                <summary>Creates a copy of a IntegerEncoder.</summary>

                <param name="copy">The IntegerEncoder to copy from</param>
                <exception cref="T:System.ArgumentNullException">if copy is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.IntegerEncoder.Dispose" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1056">
<summary>Destroys the IntegerEncoder.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.IntegerEncoder.Finalize" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1061">
<summary>Destroys the IntegerEncoder.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.IntegerEncoder.PlainModulus" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1066">
<summary>Returns a reference to the plaintext modulus.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.IntegerEncoder.Base" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1074">
<summary>Returns the base used for encoding.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.IntegerEncoder.Encode(System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1082">
<summary>Encodes an unsigned integer (represented by System::UInt64) into a plaintext polynomial.</summary>
<param name="value">The unsigned integer to encode</param>

</member>
<member name="M:Microsoft.Research.SEAL.IntegerEncoder.Encode(System.UInt64,Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1088">
<summary>Encodes an unsigned integer (represented by System::UInt64) into a plaintext polynomial.</summary>
<param name="value">The unsigned integer to encode</param>
<param name="destination">The plaintext to overwrite with the encoding</param>
<exception cref="T:System.ArgumentNullException">if destination is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.IntegerEncoder.Encode(Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1096">
<summary>Encodes an unsigned integer (represented by <see cref="T:Microsoft.Research.SEAL.BigUInt"/>) into a plaintext polynomial.</summary>
<param name="value">The unsigned integer to encode</param>
<exception cref="T:System.ArgumentNullException">if value is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.IntegerEncoder.Encode(Microsoft.Research.SEAL.BigUInt,Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1103">
<summary>Encodes an unsigned integer (represented by <see cref="T:Microsoft.Research.SEAL.BigUInt"/>) into a plaintext polynomial.</summary>
<param name="value">The unsigned integer to encode</param>
<param name="destination">The plaintext to overwrite with the encoding</param>
<exception cref="T:System.ArgumentNullException">if value or destination is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.IntegerEncoder.Encode(System.Int64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1111">
<summary>Encodes a signed integer (represented by System::Int64) into a plaintext polynomial.</summary>
<remarks>
<para>
Encodes a signed integer (represented by System::Int64) into a plaintext polynomial.
</para>
<para>
Negative integers in the base-b encoding are represented the same way as positive integers,
namely, both positive and negative integers can have both positive and negative digits in their
base-b representation. Negative coefficients are stored in the plaintext polynomials as unsigned
integers that represent them modulo the plaintext modulus. Thus, for example, a coefficient of -1
would be stored as a polynomial coefficient plainModulus-1.
</para>
</remarks>
<param name="value">The signed integer to encode</param>

</member>
<member name="M:Microsoft.Research.SEAL.IntegerEncoder.Encode(System.Int64,Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1129">
<summary>Encodes a signed integer (represented by System::Int64) into a plaintext polynomial.</summary>
<remarks>
<para>
Encodes a signed integer (represented by System::Int64) into a plaintext polynomial.
</para>
<para>
Negative integers in the base-b encoding are represented the same way as positive integers,
namely, both positive and negative integers can have both positive and negative digits in their
base-b representation. Negative coefficients are stored in the plaintext polynomials as unsigned
integers that represent them modulo the plaintext modulus. Thus, for example, a coefficient of -1
would be stored as a polynomial coefficient plainModulus-1.
</para>
</remarks>
<param name="value">The signed integer to encode</param>
<param name="destination">The plaintext to overwrite with the encoding</param>
<exception cref="T:System.ArgumentNullException">if destination is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.IntegerEncoder.DecodeUInt64(Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1149">
<summary>Decodes a plaintext polynomial and returns the result as System::UInt64.</summary>
<remarks>
Decodes a plaintext polynomial and returns the result as System::UInt64. Mathematically this amounts to evaluating the
input polynomial at X=base.
</remarks>
<param name="plain">The plaintext to be decoded</param>
<exception cref="T:System.ArgumentNullException">if plain is null</exception>
<exception cref="T:System.ArgumentException">if plain does not represent a valid plaintext polynomial</exception>
<exception cref="T:System.ArgumentException">if the output does not fit in System::UInt64</exception>

</member>
<member name="M:Microsoft.Research.SEAL.IntegerEncoder.DecodeUInt32(Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1162">
<summary>Decodes a plaintext polynomial and returns the result as System::UInt32.</summary>
<remarks>
Decodes a plaintext polynomial and returns the result as System::UInt32. Mathematically this amounts to evaluating the
input polynomial at X=base.
</remarks>
<param name="plain">The plaintext to be decoded</param>
<exception cref="T:System.ArgumentNullException">if plain is null</exception>
<exception cref="T:System.ArgumentException">if plain does not represent a valid plaintext polynomial</exception>
<exception cref="T:System.ArgumentException">if the output does not fit in System::UInt32</exception>

</member>
<member name="M:Microsoft.Research.SEAL.IntegerEncoder.DecodeInt64(Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1175">
<summary>Decodes a plaintext polynomial and returns the result as System::Int64.</summary>
<remarks>
Decodes a plaintext polynomial and returns the result as System::Int64. Mathematically this amounts to evaluating the
input polynomial at X=base.
</remarks>
<param name="plain">The plaintext to be decoded</param>
<exception cref="T:System.ArgumentNullException">if plain is null</exception>
<exception cref="T:System.ArgumentException">if plain does not represent a valid plaintext polynomial</exception>
<exception cref="T:System.ArgumentException">if the output does not fit in System::Int32</exception>

</member>
<member name="M:Microsoft.Research.SEAL.IntegerEncoder.DecodeInt32(Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1188">
<summary>Decodes a plaintext polynomial and returns the result as System::Int32.</summary>
<remarks>
Decodes a plaintext polynomial and returns the result as System::Int32. Mathematically this amounts to evaluating the
input polynomial at X=base.
</remarks>
<param name="plain">The plaintext to be decoded</param>
<exception cref="T:System.ArgumentNullException">if plain is null</exception>
<exception cref="T:System.ArgumentException">if plain does not represent a valid plaintext polynomial</exception>
<exception cref="T:System.ArgumentException">if the output does not fit in System::Int32</exception>

</member>
<member name="M:Microsoft.Research.SEAL.IntegerEncoder.DecodeBigUInt(Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1201">
<summary>Decodes a plaintext polynomial and returns the result as BigUInt.</summary>
<remarks>
Decodes a plaintext polynomial and returns the result as <see cref="T:Microsoft.Research.SEAL.BigUInt"/>. Mathematically this amounts to evaluating the input
polynomial at X=base.
</remarks>
<param name="plain">The plaintext to be decoded</param>
<exception cref="T:System.ArgumentNullException">if plain is null</exception>
<exception cref="T:System.ArgumentException">if plain does not represent a valid plaintext polynomial</exception>
<exception cref="T:System.ArgumentException">if the output is negative</exception>

</member>
<member name="M:Microsoft.Research.SEAL.IntegerEncoder.DecodeBigUInt(Microsoft.Research.SEAL.Plaintext,Microsoft.Research.SEAL.BigUInt)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1214">
<summary>Decodes a plaintext polynomial and stores the result in a given BigUInt.</summary>
<remarks>
Decodes a plaintext polynomial and stores the result in a given <see cref="T:Microsoft.Research.SEAL.BigUInt"/>. Mathematically this amounts to evaluating the
input polynomial at X=base.
</remarks>
<param name="plain">The plaintext to be decoded</param>
<param name="destination">The BigUInt to overwrite with the decoding</param>
<exception cref="T:System.ArgumentNullException">if plain or destination is null</exception>
<exception cref="T:System.ArgumentException">if plain does not represent a valid plaintext polynomial</exception>
<exception cref="T:System.ArgumentException">if the output does not fit in destination</exception>
<exception cref="T:System.ArgumentException">if the output is negative</exception>

</member>
<member name="M:Microsoft.Research.SEAL.IntegerEncoder.Encode(System.Int32)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1229">
<summary>Encodes a signed integer (represented by System::Int32) into a plaintext polynomial.</summary>
<remarks>
<para>
Encodes a signed integer (represented by System::Int32) into a plaintext polynomial.
</para>
<para>
Negative integers in the base-b encoding are represented the same way as positive integers,
namely, both positive and negative integers can have both positive and negative digits in their
base-b representation. Negative coefficients are stored in the plaintext polynomials as unsigned
integers that represent them modulo the plaintext modulus. Thus, for example, a coefficient of -1
would be stored as a polynomial coefficient plainModulus-1.
</para>
</remarks>
<param name="value">The signed integer to encode</param>

</member>
<member name="M:Microsoft.Research.SEAL.IntegerEncoder.Encode(System.UInt32)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1247">
<summary>Encodes an unsigned integer (represented by System::UInt32) into a plaintext polynomial.</summary>
<param name="value">The unsigned integer to encode</param>

</member>
<member name="M:Microsoft.Research.SEAL.IntegerEncoder.Encode(System.Int32,Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1253">
<summary>Encodes a signed integer (represented by System::Int32) into a plaintext polynomial.</summary>
<remarks>
<para>
Encodes a signed integer (represented by System::Int32) into a plaintext polynomial.
</para>
<para>
Negative integers in the base-b encoding are represented the same way as positive integers,
namely, both positive and negative integers can have both positive and negative digits in their
base-b representation. Negative coefficients are stored in the plaintext polynomials as unsigned
integers that represent them modulo the plaintext modulus. Thus, for example, a coefficient of -1
would be stored as a polynomial coefficient plainModulus-1.
</para>
</remarks>
<param name="value">The signed integer to encode</param>
<param name="destination">The plaintext to overwrite with the encoding</param>
<exception cref="T:System.ArgumentNullException">if destination is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.IntegerEncoder.Encode(System.UInt32,Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1273">
<summary>Encodes an unsigned integer (represented by System::UInt32) into a plaintext polynomial.</summary>
<param name="value">The unsigned integer to encode</param>
<param name="destination">The plaintext to overwrite with the encoding</param>
<exception cref="T:System.ArgumentNullException">if destination is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.IntegerEncoder.GetEncoder" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1282">
<summary>Returns a reference to the underlying C++ IntegerEncoder.</summary>

</member>
<!-- Discarding badly formed XML document comment for member 'T:Microsoft.Research.SEAL.FractionalEncoder'. -->
<member name="M:Microsoft.Research.SEAL.FractionalEncoder.#ctor(Microsoft.Research.SEAL.SmallModulus,Microsoft.Research.SEAL.BigPoly,System.Int32,System.Int32)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1353">
<summary>Creates a new FractionalEncoder object.</summary>
<remarks>
Creates a new FractionalEncoder object. The constructor takes as input a reference
to the plaintext modulus, a reference to the polynomial modulus,
and the numbers of coefficients that are reserved for the integral and fractional parts.
The base used for encoding is taken to be 2. The coefficients for the integral part are 
counted starting from the low-degree end of the polynomial, and the coefficients for the 
fractional part are counted from the high-degree end.
</remarks>
<param name="plainModulus">The plaintext modulus (represented by <see cref="T:Microsoft.Research.SEAL.SmallModulus"/>)</param>
<param name="polyModulus">The polynomial modulus (represented by <see cref="T:Microsoft.Research.SEAL.BigPoly"/>)</param>
<param name="integerCoeffCount">The number of polynomial coefficients reserved for the integral part</param>
<param name="fractionCoeffCount">The number of polynomial coefficients reserved for the fractional part</param>
<exception cref="T:System.ArgumentNullException">if plainModulus or polyModulus is null</exception>
<exception cref="T:System.ArgumentException">if plainModulus is not at least 2</exception>
<exception cref="T:System.ArgumentException">if integerCoeffCount is not strictly positive</exception>
<exception cref="T:System.ArgumentException">if fractionCoeffCount is not strictly positive</exception>
<exception cref="T:System.ArgumentException">if polyModulus is zero</exception>
<exception cref="T:System.ArgumentException">if polyModulus is too small for the integral and fractional parts</exception>

</member>
<member name="M:Microsoft.Research.SEAL.FractionalEncoder.#ctor(Microsoft.Research.SEAL.SmallModulus,Microsoft.Research.SEAL.BigPoly,System.Int32,System.Int32,System.UInt64)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1376">
<summary>Creates a new FractionalEncoder object.</summary>
<remarks>
Creates a new FractionalEncoder object. The constructor takes as input a reference
to the plaintext modulus, a reference to the polynomial modulus,
and the numbers of coefficients that are reserved for the integral and fractional parts,
and an integer, at least 2, that is used as the base in the encoding. The coefficients 
for the integral part are counted starting from the low-degree end of the polynomial, 
and the coefficients for the fractional part are counted from the high-degree end.
</remarks>
<param name="plainModulus">The plaintext modulus (represented by <see cref="T:Microsoft.Research.SEAL.SmallModulus"/>)</param>
<param name="polyModulus">The polynomial modulus (represented by <see cref="T:Microsoft.Research.SEAL.BigPoly"/>)</param>
<param name="integerCoeffCount">The number of polynomial coefficients reserved for the integral part</param>
<param name="fractionCoeffCount">The number of polynomial coefficients reserved for the fractional part</param>
<param name="base">The base to be used for encoding</param>
<exception cref="T:System.ArgumentNullException">if plainModulus or polyModulus is null</exception>
<exception cref="T:System.ArgumentException">if plainModulus is not at least base</exception>
<exception cref="T:System.ArgumentException">if integerCoeffCount is not strictly positive</exception>
<exception cref="T:System.ArgumentException">if fractionCoeffCount is not strictly positive</exception>
<exception cref="T:System.ArgumentException">if polyModulus is zero</exception>
<exception cref="T:System.ArgumentException">if polyModulus is too small for the integral and fractional
parts</exception>
<exception cref="T:System.ArgumentException">if base is not an integer and at least 2</exception>

</member>
<member name="M:Microsoft.Research.SEAL.FractionalEncoder.#ctor(Microsoft.Research.SEAL.FractionalEncoder)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1403">
                <summary>Creates a copy of a FractionalEncoder.</summary>

                <param name="copy">The FractionalEncoder to copy from</param>
                <exception cref="T:System.ArgumentNullException">if copy is null</exception>

</member>
<member name="M:Microsoft.Research.SEAL.FractionalEncoder.Dispose" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1411">
<summary>Destroys the FractionalEncoder.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.FractionalEncoder.Finalize" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1416">
<summary>Destroys the FractionalEncoder.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.FractionalEncoder.Encode(System.Double)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1421">
<summary>Encodes a double precision floating point number into a plaintext polynomial.</summary>
<param name="value">The double-precision floating-point number to encode</param>

</member>
<member name="M:Microsoft.Research.SEAL.FractionalEncoder.Decode(Microsoft.Research.SEAL.Plaintext)" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1427">
<summary>Decodes a plaintext polynomial and returns the result as a double-precision floating-point number.</summary>
<param name="plain">The plaintext to be decoded</param>
<exception cref="T:System.ArgumentNullException">if plain is null</exception>
<exception cref="T:System.ArgumentException">if plain does not represent a valid plaintext polynomial</exception>
<exception cref="T:System.ArgumentException">if either the integral part does not fit in System::Int64</exception>

</member>
<member name="P:Microsoft.Research.SEAL.FractionalEncoder.PlainModulus" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1436">
<summary>Returns a reference to the plaintext modulus.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.FractionalEncoder.PolyModulus" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1444">
<summary>Returns a reference to the polynomial modulus.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.FractionalEncoder.FractionCoeffCount" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1452">
<summary>Returns the number of coefficients reserved for the fractional part.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.FractionalEncoder.IntegerCoeffCount" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1460">
<summary>Returns the number of coefficients reserved for the integral part.</summary>

</member>
<member name="P:Microsoft.Research.SEAL.FractionalEncoder.Base" decl="false" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1468">
<summary>Returns the base used for encoding.</summary>

</member>
<member name="M:Microsoft.Research.SEAL.FractionalEncoder.GetEncoder" decl="true" source="c:\hackaton\seal_2.3.1\sealnet\sealnet\encoderwrapper.h" line="1477">
<summary>Returns a reference to the underlying C++ FractionalEncoder.</summary>

</member>
</members>
</doc>