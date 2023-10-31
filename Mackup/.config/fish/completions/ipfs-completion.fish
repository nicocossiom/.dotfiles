#!/usr/bin/env fish
function __fish_ipfs_seen_all_subcommands_from
     set -l cmd (commandline -poc)
     set -e cmd[1]
     for c in $argv
         if not contains -- $c $cmd
               return 1
        end
     end
     return 0
end

function __fish_ipfs_use_subcommand
	set -e argv[-1]
	set -l cmd (commandline -poc)
	set -e cmd[1]
	for i in $cmd
	    switch $i
		    case '-*'
			    continue
            case $argv[1]
                set argv $argv[2..]
                continue
            case '*'
                return 1
        end
	end
	test -z "$argv"
end

complete -c ipfs -l help -d "Show the full command help text."

complete -c ipfs --keep-order --no-files

complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from' -s D -l debug -d "Operate in debug mode."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from' -l help -d "Show the full command help text."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from' -s h -l h -d "Show a short version of the command help text."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from' -s L -l local -d "Run the command locally, instead of using the daemon. DEPRECATED: use --offline."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from' -l offline -d "Run the command offline."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from' -l upgrade-cidv0-in-output -d "Upgrade version 0 to version 1 CIDs in output."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from' -l stream-channels -d "Stream channel output."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from' -r -l repo-dir -d "Path to the repository directory to use."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from' -r -l config-file -d "Path to the configuration file to use."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from' -r -s c -l config -d "[DEPRECATED] Path to the configuration file to use."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from' -r -l api -d "Use a specific API instance (defaults to /ip4/127.0.0.1/tcp/5001)."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from' -r -l cid-base -d "Multibase encoding used for version 1 CIDs in output."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from' -r -l encoding -d "The encoding type the output should be encoded with (json, xml, or text). Default: text."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from' -r -l timeout -d "Set a global timeout on the command."

# add
complete -c ipfs -n '__fish_ipfs_use_subcommand add' -a add -d "Add a file or directory to IPFS."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from add' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from add' -s r -l recursive -d "Add directory paths recursively."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from add' -l dereference-args -d "Symlinks supplied in arguments are dereferenced."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from add' -s H -l hidden -d "Include files that are hidden. Only takes effect on recursive add."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from add' -s q -l quiet -d "Write minimal output."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from add' -s Q -l quieter -d "Write only final hash."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from add' -l silent -d "Write no output."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from add' -s p -l progress -d "Stream progress data."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from add' -s t -l trickle -d "Use trickle-dag format for dag generation."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from add' -s n -l only-hash -d "Only chunk and hash - do not write to disk."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from add' -s w -l wrap-with-directory -d "Wrap files with a directory object."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from add' -l raw-leaves -d "Use raw blocks for leaf nodes."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from add' -l nocopy -d "Add the file using filestore. Implies raw-leaves. (experimental)."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from add' -l fscache -d "Check the filestore for pre-existing blocks. (experimental)."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from add' -l inline -d "Inline small blocks into CIDs. (experimental)."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from add' -l pin -d "Pin locally to protect added files from garbage collection. Default: true."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from add' -r -l stdin-name -d "Assign a name if the file source is stdin."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from add' -r -l ignore -d "A rule (.gitignore-stype) defining which file(s) should be ignored (variadic, experimental)."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from add' -r -l ignore-rules-path -d "A path to a file with .gitignore-style ignore rules (experimental)."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from add' -r -s s -l chunker -d "Chunking algorithm, size-[bytes], rabin-[min]-[avg]-[max] or buzhash. Default: size-262144."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from add' -r -l cid-version -d "CID version. Defaults to 0 unless an option that depends on CIDv1 is passed. Passing version 1 will cause the raw-leaves option to default to true."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from add' -r -l hash -d "Hash function to use. Implies CIDv1 if not sha2-256. (experimental). Default: sha2-256."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from add' -r -l inline-limit -d "Maximum block size to inline. (experimental). Default: 32."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from add' -r -l to-files -d "Add reference to Files API (MFS) at the provided path."


# bitswap
complete -c ipfs -n '__fish_ipfs_use_subcommand bitswap' -a bitswap -d "Interact with the bitswap agent."

# bitswap ledger
complete -c ipfs -n '__fish_ipfs_use_subcommand bitswap ledger' -a ledger -d "Show the current ledger for a peer."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from bitswap ledger' -F


# bitswap reprovide
complete -c ipfs -n '__fish_ipfs_use_subcommand bitswap reprovide' -a reprovide -d "Trigger reprovider."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from bitswap reprovide' -F


# bitswap stat
complete -c ipfs -n '__fish_ipfs_use_subcommand bitswap stat' -a stat -d "Show some diagnostic information on the bitswap agent."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from bitswap stat' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from bitswap stat' -s v -l verbose -d "Print extra information."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from bitswap stat' -l human -d "Print sizes in human readable format (e.g., 1K 234M 2G)."


# bitswap wantlist
complete -c ipfs -n '__fish_ipfs_use_subcommand bitswap wantlist' -a wantlist -d "Show blocks currently on the wantlist."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from bitswap wantlist' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from bitswap wantlist' -r -s p -l peer -d "Specify which peer to show wantlist for. Default: self."



# block
complete -c ipfs -n '__fish_ipfs_use_subcommand block' -a block -d "Interact with raw IPFS blocks."

# block get
complete -c ipfs -n '__fish_ipfs_use_subcommand block get' -a get -d "Get a raw IPFS block."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from block get' -F


# block put
complete -c ipfs -n '__fish_ipfs_use_subcommand block put' -a put -d "Store input as an IPFS block."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from block put' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from block put' -l pin -d "Pin added blocks recursively. Default: false."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from block put' -l allow-big-block -d "Disable block size check and allow creation of blocks bigger than 1MiB. WARNING: such blocks won't be transferable over the standard bitswap. Default: false."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from block put' -r -l cid-codec -d "Multicodec to use in returned CID. Default: raw."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from block put' -r -l mhtype -d "Multihash hash function. Default: sha2-256."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from block put' -r -l mhlen -d "Multihash hash length. Default: -1."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from block put' -r -s f -l format -d "Use legacy format for returned CID (DEPRECATED)."


# block rm
complete -c ipfs -n '__fish_ipfs_use_subcommand block rm' -a rm -d "Remove IPFS block(s) from the local datastore."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from block rm' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from block rm' -s f -l force -d "Ignore nonexistent blocks."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from block rm' -s q -l quiet -d "Write minimal output."


# block stat
complete -c ipfs -n '__fish_ipfs_use_subcommand block stat' -a stat -d "Print information of a raw IPFS block."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from block stat' -F



# bootstrap
complete -c ipfs -n '__fish_ipfs_use_subcommand bootstrap' -a bootstrap -d "Show or edit the list of bootstrap peers."

# bootstrap add
complete -c ipfs -n '__fish_ipfs_use_subcommand bootstrap add' -a add -d "Add peers to the bootstrap list."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from bootstrap add' -l default -d "Add default bootstrap nodes. (Deprecated, use 'default' subcommand instead)."

# bootstrap add default
complete -c ipfs -n '__fish_ipfs_use_subcommand bootstrap add default' -a default -d "Add default peers to the bootstrap list."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from bootstrap add default' -F



# bootstrap list
complete -c ipfs -n '__fish_ipfs_use_subcommand bootstrap list' -a list -d "Show peers in the bootstrap list."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from bootstrap list' -F


# bootstrap rm
complete -c ipfs -n '__fish_ipfs_use_subcommand bootstrap rm' -a rm -d "Remove peers from the bootstrap list."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from bootstrap rm' -l all -d "Remove all bootstrap peers. (Deprecated, use 'all' subcommand)."

# bootstrap rm all
complete -c ipfs -n '__fish_ipfs_use_subcommand bootstrap rm all' -a all -d "Remove all peers from the bootstrap list."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from bootstrap rm all' -F




# cat
complete -c ipfs -n '__fish_ipfs_use_subcommand cat' -a cat -d "Show IPFS object data."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from cat' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from cat' -s p -l progress -d "Stream progress data. Default: true."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from cat' -r -s o -l offset -d "Byte offset to begin reading from."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from cat' -r -s l -l length -d "Maximum number of bytes to read."


# cid
complete -c ipfs -n '__fish_ipfs_use_subcommand cid' -a cid -d "Convert and discover properties of CIDs"

# cid base32
complete -c ipfs -n '__fish_ipfs_use_subcommand cid base32' -a base32 -d "Convert CIDs to Base32 CID version 1."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from cid base32' -F


# cid bases
complete -c ipfs -n '__fish_ipfs_use_subcommand cid bases' -a bases -d "List available multibase encodings."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from cid bases' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from cid bases' -l prefix -d "also include the single letter prefixes in addition to the code."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from cid bases' -l numeric -d "also include numeric codes."


# cid codecs
complete -c ipfs -n '__fish_ipfs_use_subcommand cid codecs' -a codecs -d "List available CID multicodecs."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from cid codecs' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from cid codecs' -s n -l numeric -d "also include numeric codes."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from cid codecs' -s s -l supported -d "list only codecs supported by go-ipfs commands."


# cid format
complete -c ipfs -n '__fish_ipfs_use_subcommand cid format' -a format -d "Format and convert a CID in various useful ways."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from cid format' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from cid format' -r -s f -l f -d "Printf style format string. Default: %s."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from cid format' -r -s v -l v -d "CID version to convert to."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from cid format' -r -l mc -d "CID multicodec to convert to."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from cid format' -r -s b -l b -d "Multibase to display CID in."


# cid hashes
complete -c ipfs -n '__fish_ipfs_use_subcommand cid hashes' -a hashes -d "List available multihashes."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from cid hashes' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from cid hashes' -s n -l numeric -d "also include numeric codes."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from cid hashes' -s s -l supported -d "list only codecs supported by go-ipfs commands."



# commands
complete -c ipfs -n '__fish_ipfs_use_subcommand commands' -a commands -d "List all available commands."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from commands' -s f -l flags -d "Show command flags."

# commands completion
complete -c ipfs -n '__fish_ipfs_use_subcommand commands completion' -a completion -d "Generate shell completions."

# commands completion bash
complete -c ipfs -n '__fish_ipfs_use_subcommand commands completion bash' -a bash -d "Generate bash shell completions."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from commands completion bash' -F


# commands completion fish
complete -c ipfs -n '__fish_ipfs_use_subcommand commands completion fish' -a fish -d "Generate fish shell completions."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from commands completion fish' -F




# config
complete -c ipfs -n '__fish_ipfs_use_subcommand config' -a config -d "Get and set IPFS config values."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from config' -l bool -d "Set a boolean value."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from config' -l json -d "Parse stringified JSON."

# config edit
complete -c ipfs -n '__fish_ipfs_use_subcommand config edit' -a edit -d "Open the config file for editing in $EDITOR."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from config edit' -F


# config profile
complete -c ipfs -n '__fish_ipfs_use_subcommand config profile' -a profile -d "Apply profiles to config."

# config profile apply
complete -c ipfs -n '__fish_ipfs_use_subcommand config profile apply' -a apply -d "Apply profile to config."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from config profile apply' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from config profile apply' -l dry-run -d "print difference between the current config and the config that would be generated."



# config replace
complete -c ipfs -n '__fish_ipfs_use_subcommand config replace' -a replace -d "Replace the config with <file>."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from config replace' -F


# config show
complete -c ipfs -n '__fish_ipfs_use_subcommand config show' -a show -d "Output config file contents."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from config show' -F



# daemon
complete -c ipfs -n '__fish_ipfs_use_subcommand daemon' -a daemon -d "Run a network-connected IPFS node."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from daemon' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from daemon' -l init -d "Initialize ipfs with default settings if not already initialized."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from daemon' -l mount -d "Mounts IPFS to the filesystem using FUSE (experimental)."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from daemon' -l writable -d "Enable legacy Gateway.Writable (REMOVED)."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from daemon' -l unrestricted-api -d "Allow API access to unlisted hashes."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from daemon' -l disable-transport-encryption -d "Disable transport encryption (for debugging protocols)."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from daemon' -l enable-gc -d "Enable automatic periodic repo garbage collection."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from daemon' -l manage-fdlimit -d "Check and raise file descriptor limits if needed. Default: true."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from daemon' -l migrate -d "If true, assume yes at the migrate prompt. If false, assume no."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from daemon' -l enable-pubsub-experiment -d "DEPRECATED."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from daemon' -l enable-namesys-pubsub -d "Enable IPNS over pubsub. Implicitly enables pubsub, overrides Ipns.UsePubsub config."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from daemon' -l enable-mplex-experiment -d "DEPRECATED."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from daemon' -r -l init-config -d "Path to existing configuration file to be loaded during --init."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from daemon' -r -l init-profile -d "Configuration profiles to apply for --init. See ipfs init --help for more."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from daemon' -r -l routing -d "Overrides the routing option. Default: default."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from daemon' -r -l mount-ipfs -d "Path to the mountpoint for IPFS (if using --mount). Defaults to config setting."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from daemon' -r -l mount-ipns -d "Path to the mountpoint for IPNS (if using --mount). Defaults to config setting."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from daemon' -r -l agent-version-suffix -d "Optional suffix to the AgentVersion presented by `ipfs id` and also advertised through BitSwap."


# dag
complete -c ipfs -n '__fish_ipfs_use_subcommand dag' -a dag -d "Interact with IPLD DAG objects."

# dag export
complete -c ipfs -n '__fish_ipfs_use_subcommand dag export' -a export -d "Streams the selected DAG as a .car stream on stdout."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dag export' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dag export' -s p -l progress -d "Display progress on CLI. Defaults to true when STDERR is a TTY."


# dag get
complete -c ipfs -n '__fish_ipfs_use_subcommand dag get' -a get -d "Get a DAG node from IPFS."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dag get' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dag get' -r -l output-codec -d "Format that the object will be encoded as. Default: dag-json."


# dag import
complete -c ipfs -n '__fish_ipfs_use_subcommand dag import' -a import -d "Import the contents of .car files"
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dag import' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dag import' -l pin-roots -d "Pin optional roots listed in the .car headers after importing. Default: true."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dag import' -l silent -d "No output."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dag import' -l stats -d "Output stats."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dag import' -l allow-big-block -d "Disable block size check and allow creation of blocks bigger than 1MiB. WARNING: such blocks won't be transferable over the standard bitswap. Default: false."


# dag put
complete -c ipfs -n '__fish_ipfs_use_subcommand dag put' -a put -d "Add a DAG node to IPFS."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dag put' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dag put' -l pin -d "Pin this object when adding."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dag put' -l allow-big-block -d "Disable block size check and allow creation of blocks bigger than 1MiB. WARNING: such blocks won't be transferable over the standard bitswap. Default: false."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dag put' -r -l store-codec -d "Codec that the stored object will be encoded with. Default: dag-cbor."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dag put' -r -l input-codec -d "Codec that the input object is encoded in. Default: dag-json."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dag put' -r -l hash -d "Hash function to use. Default: sha2-256."


# dag resolve
complete -c ipfs -n '__fish_ipfs_use_subcommand dag resolve' -a resolve -d "Resolve IPLD block."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dag resolve' -F


# dag stat
complete -c ipfs -n '__fish_ipfs_use_subcommand dag stat' -a stat -d "Gets stats for a DAG."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dag stat' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dag stat' -s p -l progress -d "Return progressive data while reading through the DAG. Default: true."



# dht
complete -c ipfs -n '__fish_ipfs_use_subcommand dht' -a dht -d "Issue commands directly through the DHT."

# dht findpeer
complete -c ipfs -n '__fish_ipfs_use_subcommand dht findpeer' -a findpeer -d "Find the multiaddresses associated with a Peer ID."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dht findpeer' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dht findpeer' -s v -l verbose -d "Print extra information."


# dht findprovs
complete -c ipfs -n '__fish_ipfs_use_subcommand dht findprovs' -a findprovs -d "Find peers that can provide a specific value, given a key."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dht findprovs' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dht findprovs' -s v -l verbose -d "Print extra information."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dht findprovs' -r -s n -l num-providers -d "The number of providers to find. Default: 20."


# dht get
complete -c ipfs -n '__fish_ipfs_use_subcommand dht get' -a get -d "Given a key, query the routing system for its best value."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dht get' -F


# dht provide
complete -c ipfs -n '__fish_ipfs_use_subcommand dht provide' -a provide -d "Announce to the network that you are providing given values."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dht provide' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dht provide' -s v -l verbose -d "Print extra information."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dht provide' -s r -l recursive -d "Recursively provide entire graph."


# dht put
complete -c ipfs -n '__fish_ipfs_use_subcommand dht put' -a put -d "Write a key/value pair to the routing system."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dht put' -F


# dht query
complete -c ipfs -n '__fish_ipfs_use_subcommand dht query' -a query -d "Find the closest Peer IDs to a given Peer ID by querying the DHT."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dht query' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dht query' -s v -l verbose -d "Print extra information."



# diag
complete -c ipfs -n '__fish_ipfs_use_subcommand diag' -a diag -d "Generate diagnostic reports."

# diag cmds
complete -c ipfs -n '__fish_ipfs_use_subcommand diag cmds' -a cmds -d "List commands run on this IPFS node."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from diag cmds' -s v -l verbose -d "Print extra information."

# diag cmds clear
complete -c ipfs -n '__fish_ipfs_use_subcommand diag cmds clear' -a clear -d "Clear inactive requests from the log."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from diag cmds clear' -F


# diag cmds set-time
complete -c ipfs -n '__fish_ipfs_use_subcommand diag cmds set-time' -a set-time -d "Set how long to keep inactive requests in the log."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from diag cmds set-time' -F



# diag profile
complete -c ipfs -n '__fish_ipfs_use_subcommand diag profile' -a profile -d "Collect a performance profile for debugging."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from diag profile' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from diag profile' -r -s o -l output -d "The path where the output .zip should be stored. Default: ./ipfs-profile-[timestamp].zip."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from diag profile' -r -l collectors -d "The list of collectors to use for collecting diagnostic data. Default: [goroutines-stack goroutines-pprof version heap allocs bin cpu mutex block]."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from diag profile' -r -l profile-time -d "The amount of time spent profiling. If this is set to 0, then sampling profiles are skipped. Default: 30s."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from diag profile' -r -l mutex-profile-fraction -d "The fraction 1/n of mutex contention events that are reported in the mutex profile. Default: 4."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from diag profile' -r -l block-profile-rate -d "The duration to wait between sampling goroutine-blocking events for the blocking profile. Default: 1ms."


# diag sys
complete -c ipfs -n '__fish_ipfs_use_subcommand diag sys' -a sys -d "Print system diagnostic information."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from diag sys' -F



# dns
complete -c ipfs -n '__fish_ipfs_use_subcommand dns' -a dns -d "Resolve DNSLink records."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dns' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from dns' -s r -l recursive -d "Resolve until the result is not a DNS link. Default: true."


# file
complete -c ipfs -n '__fish_ipfs_use_subcommand file' -a file -d "Interact with IPFS objects representing Unix filesystems."

# file ls
complete -c ipfs -n '__fish_ipfs_use_subcommand file ls' -a ls -d "List directory contents for Unix filesystem objects. Deprecated: Use 'ipfs ls' and 'ipfs files ls' instead."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from file ls' -F



# files
complete -c ipfs -n '__fish_ipfs_use_subcommand files' -a files -d "Interact with unixfs files."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files' -s f -l flush -d "Flush target and ancestors after write. Default: true."

# files chcid
complete -c ipfs -n '__fish_ipfs_use_subcommand files chcid' -a chcid -d "Change the CID version or hash function of the root node of a given path."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files chcid' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files chcid' -r -l cid-version -d "Cid version to use. (experimental)."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files chcid' -r -l hash -d "Hash function to use. Will set Cid version to 1 if used. (experimental)."


# files cp
complete -c ipfs -n '__fish_ipfs_use_subcommand files cp' -a cp -d "Add references to IPFS files and directories in MFS (or copy within MFS)."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files cp' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files cp' -s p -l parents -d "Make parent directories as needed."


# files flush
complete -c ipfs -n '__fish_ipfs_use_subcommand files flush' -a flush -d "Flush a given path's data to disk."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files flush' -F


# files ls
complete -c ipfs -n '__fish_ipfs_use_subcommand files ls' -a ls -d "List directories in the local mutable namespace."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files ls' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files ls' -s l -l long -d "Use long listing format."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files ls' -s U -l U -d "Do not sort; list entries in directory order."


# files mkdir
complete -c ipfs -n '__fish_ipfs_use_subcommand files mkdir' -a mkdir -d "Make directories."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files mkdir' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files mkdir' -s p -l parents -d "No error if existing, make parent directories as needed."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files mkdir' -r -l cid-version -d "Cid version to use. (experimental)."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files mkdir' -r -l hash -d "Hash function to use. Will set Cid version to 1 if used. (experimental)."


# files mv
complete -c ipfs -n '__fish_ipfs_use_subcommand files mv' -a mv -d "Move files."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files mv' -F


# files read
complete -c ipfs -n '__fish_ipfs_use_subcommand files read' -a read -d "Read a file from MFS."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files read' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files read' -r -s o -l offset -d "Byte offset to begin reading from."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files read' -r -s n -l count -d "Maximum number of bytes to read."


# files rm
complete -c ipfs -n '__fish_ipfs_use_subcommand files rm' -a rm -d "Remove a file from MFS."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files rm' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files rm' -s r -l recursive -d "Recursively remove directories."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files rm' -l force -d "Forcibly remove target at path; implies -r for directories."


# files stat
complete -c ipfs -n '__fish_ipfs_use_subcommand files stat' -a stat -d "Display file status."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files stat' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files stat' -l hash -d "Print only hash. Implies '--format=<hash>'. Conflicts with other format options."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files stat' -l size -d "Print only size. Implies '--format=<cumulsize>'. Conflicts with other format options."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files stat' -l with-local -d "Compute the amount of the dag that is local, and if possible the total size."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files stat' -r -l format -d "Print statistics in given format. Allowed tokens: <hash> <size> <cumulsize> <type> <childs>. Conflicts with other format options. Default: <hash>
Size: <size>
CumulativeSize: <cumulsize>
ChildBlocks: <childs>
Type: <type>."


# files write
complete -c ipfs -n '__fish_ipfs_use_subcommand files write' -a write -d "Append to (modify) a file in MFS."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files write' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files write' -s e -l create -d "Create the file if it does not exist."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files write' -s p -l parents -d "Make parent directories as needed."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files write' -s t -l truncate -d "Truncate the file to size zero before writing."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files write' -l raw-leaves -d "Use raw blocks for newly created leaf nodes. (experimental)."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files write' -r -s o -l offset -d "Byte offset to begin writing at."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files write' -r -s n -l count -d "Maximum number of bytes to read."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files write' -r -l cid-version -d "Cid version to use. (experimental)."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from files write' -r -l hash -d "Hash function to use. Will set Cid version to 1 if used. (experimental)."



# filestore
complete -c ipfs -n '__fish_ipfs_use_subcommand filestore' -a filestore -d "Interact with filestore objects."

# filestore dups
complete -c ipfs -n '__fish_ipfs_use_subcommand filestore dups' -a dups -d "List blocks that are both in the filestore and standard block storage."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from filestore dups' -F


# filestore ls
complete -c ipfs -n '__fish_ipfs_use_subcommand filestore ls' -a ls -d "List objects in filestore."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from filestore ls' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from filestore ls' -l file-order -d "sort the results based on the path of the backing file."


# filestore verify
complete -c ipfs -n '__fish_ipfs_use_subcommand filestore verify' -a verify -d "Verify objects in filestore."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from filestore verify' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from filestore verify' -l file-order -d "verify the objects based on the order of the backing file."



# get
complete -c ipfs -n '__fish_ipfs_use_subcommand get' -a get -d "Download IPFS objects."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from get' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from get' -s a -l archive -d "Output a TAR archive."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from get' -s C -l compress -d "Compress the output with GZIP compression."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from get' -s p -l progress -d "Stream progress data. Default: true."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from get' -r -s o -l output -d "The path where the output should be stored."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from get' -r -s l -l compression-level -d "The level of compression (1-9)."


# id
complete -c ipfs -n '__fish_ipfs_use_subcommand id' -a id -d "Show IPFS node id info."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from id' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from id' -r -s f -l format -d "Optional output format."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from id' -r -l peerid-base -d "Encoding used for peer IDs: Can either be a multibase encoded CID or a base58btc encoded multihash. Takes {b58mh|base36|k|base32|b...}. Default: b58mh."


# init
complete -c ipfs -n '__fish_ipfs_use_subcommand init' -a init -d "Initializes ipfs config file."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from init' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from init' -s e -l empty-repo -d "Don't add and pin help files to the local storage. Default: true."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from init' -r -s a -l algorithm -d "Cryptographic algorithm to use for key generation. Default: ed25519."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from init' -r -s b -l bits -d "Number of bits to use in the generated RSA private key."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from init' -r -s p -l profile -d "Apply profile settings to config. Multiple profiles can be separated by ','."


# key
complete -c ipfs -n '__fish_ipfs_use_subcommand key' -a key -d "Create and list IPNS name keypairs"

# key export
complete -c ipfs -n '__fish_ipfs_use_subcommand key export' -a export -d "Export a keypair"
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from key export' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from key export' -r -s o -l output -d "The path where the output should be stored."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from key export' -r -s f -l format -d "The format of the exported private key, libp2p-protobuf-cleartext or pem-pkcs8-cleartext. Default: libp2p-protobuf-cleartext."


# key gen
complete -c ipfs -n '__fish_ipfs_use_subcommand key gen' -a gen -d "Create a new keypair"
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from key gen' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from key gen' -r -s t -l type -d "type of the key to create: rsa, ed25519. Default: ed25519."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from key gen' -r -s s -l size -d "size of the key to generate."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from key gen' -r -l ipns-base -d "Encoding used for keys: Can either be a multibase encoded CID or a base58btc encoded multihash. Takes {b58mh|base36|k|base32|b...}. Default: base36."


# key import
complete -c ipfs -n '__fish_ipfs_use_subcommand key import' -a import -d "Import a key and prints imported key id"
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from key import' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from key import' -l allow-any-key-type -d "Allow importing any key type. Default: false."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from key import' -r -l ipns-base -d "Encoding used for keys: Can either be a multibase encoded CID or a base58btc encoded multihash. Takes {b58mh|base36|k|base32|b...}. Default: base36."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from key import' -r -s f -l format -d "The format of the private key to import, libp2p-protobuf-cleartext or pem-pkcs8-cleartext. Default: libp2p-protobuf-cleartext."


# key list
complete -c ipfs -n '__fish_ipfs_use_subcommand key list' -a list -d "List all local keypairs."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from key list' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from key list' -s l -l l -d "Show extra information about keys."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from key list' -r -l ipns-base -d "Encoding used for keys: Can either be a multibase encoded CID or a base58btc encoded multihash. Takes {b58mh|base36|k|base32|b...}. Default: base36."


# key rename
complete -c ipfs -n '__fish_ipfs_use_subcommand key rename' -a rename -d "Rename a keypair."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from key rename' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from key rename' -s f -l force -d "Allow to overwrite an existing key."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from key rename' -r -l ipns-base -d "Encoding used for keys: Can either be a multibase encoded CID or a base58btc encoded multihash. Takes {b58mh|base36|k|base32|b...}. Default: base36."


# key rm
complete -c ipfs -n '__fish_ipfs_use_subcommand key rm' -a rm -d "Remove a keypair."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from key rm' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from key rm' -s l -l l -d "Show extra information about keys."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from key rm' -r -l ipns-base -d "Encoding used for keys: Can either be a multibase encoded CID or a base58btc encoded multihash. Takes {b58mh|base36|k|base32|b...}. Default: base36."


# key rotate
complete -c ipfs -n '__fish_ipfs_use_subcommand key rotate' -a rotate -d "Rotates the IPFS identity."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from key rotate' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from key rotate' -r -s o -l oldkey -d "Keystore name to use for backing up your existing identity."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from key rotate' -r -s t -l type -d "type of the key to create: rsa, ed25519. Default: ed25519."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from key rotate' -r -s s -l size -d "size of the key to generate."



# log
complete -c ipfs -n '__fish_ipfs_use_subcommand log' -a log -d "Interact with the daemon log output."

# log level
complete -c ipfs -n '__fish_ipfs_use_subcommand log level' -a level -d "Change the logging level."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from log level' -F


# log ls
complete -c ipfs -n '__fish_ipfs_use_subcommand log ls' -a ls -d "List the logging subsystems."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from log ls' -F


# log tail
complete -c ipfs -n '__fish_ipfs_use_subcommand log tail' -a tail -d "Read the event log."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from log tail' -F



# ls
complete -c ipfs -n '__fish_ipfs_use_subcommand ls' -a ls -d "List directory contents for Unix filesystem objects."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from ls' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from ls' -s v -l headers -d "Print table headers (Hash, Size, Name)."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from ls' -l resolve-type -d "Resolve linked objects to find out their types. Default: true."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from ls' -l size -d "Resolve linked objects to find out their file size. Default: true."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from ls' -s s -l stream -d "Enable experimental streaming of directory entries as they are traversed."


# mount
complete -c ipfs -n '__fish_ipfs_use_subcommand mount' -a mount -d "Mounts IPFS to the filesystem (read-only)."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from mount' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from mount' -r -s f -l ipfs-path -d "The path where IPFS should be mounted."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from mount' -r -s n -l ipns-path -d "The path where IPNS should be mounted."


# multibase
complete -c ipfs -n '__fish_ipfs_use_subcommand multibase' -a multibase -d "Encode and decode files or stdin with multibase format"

# multibase decode
complete -c ipfs -n '__fish_ipfs_use_subcommand multibase decode' -a decode -d "Decode multibase string"
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from multibase decode' -F


# multibase encode
complete -c ipfs -n '__fish_ipfs_use_subcommand multibase encode' -a encode -d "Encode data into multibase string"
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from multibase encode' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from multibase encode' -r -s b -l b -d "multibase encoding. Default: base64url."


# multibase list
complete -c ipfs -n '__fish_ipfs_use_subcommand multibase list' -a list -d "List available multibase encodings."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from multibase list' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from multibase list' -l prefix -d "also include the single letter prefixes in addition to the code."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from multibase list' -l numeric -d "also include numeric codes."


# multibase transcode
complete -c ipfs -n '__fish_ipfs_use_subcommand multibase transcode' -a transcode -d "Transcode multibase string between bases"
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from multibase transcode' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from multibase transcode' -r -s b -l b -d "multibase encoding. Default: base64url."



# name
complete -c ipfs -n '__fish_ipfs_use_subcommand name' -a name -d "Publish and resolve IPNS names."

# name inspect
complete -c ipfs -n '__fish_ipfs_use_subcommand name inspect' -a inspect -d "Inspects an IPNS Record"
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from name inspect' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from name inspect' -r -l verify -d "CID of the public IPNS key to validate against."


# name publish
complete -c ipfs -n '__fish_ipfs_use_subcommand name publish' -a publish -d "Publish IPNS names."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from name publish' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from name publish' -l resolve -d "Check if the given path can be resolved before publishing. Default: true."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from name publish' -l allow-offline -d "When offline, save the IPNS record to the the local datastore without broadcasting to the network instead of simply failing."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from name publish' -s Q -l quieter -d "Write only final hash."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from name publish' -r -s t -l lifetime -d "Time duration that the record will be valid for. Default: 24h.
    This accepts durations such as "300s", "1.5h" or "2h45m". Valid time units are
    "ns", "us" (or "µs"), "ms", "s", "m", "h"."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from name publish' -r -l ttl -d "Time duration this record should be cached for. Uses the same syntax as the lifetime option. (caution: experimental)."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from name publish' -r -s k -l key -d "Name of the key to be used or a valid PeerID, as listed by 'ipfs key list -l'. Default: self."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from name publish' -r -l ipns-base -d "Encoding used for keys: Can either be a multibase encoded CID or a base58btc encoded multihash. Takes {b58mh|base36|k|base32|b...}. Default: base36."


# name pubsub
complete -c ipfs -n '__fish_ipfs_use_subcommand name pubsub' -a pubsub -d "IPNS pubsub management"

# name pubsub cancel
complete -c ipfs -n '__fish_ipfs_use_subcommand name pubsub cancel' -a cancel -d "Cancel a name subscription."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from name pubsub cancel' -F


# name pubsub state
complete -c ipfs -n '__fish_ipfs_use_subcommand name pubsub state' -a state -d "Query the state of IPNS pubsub."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from name pubsub state' -F


# name pubsub subs
complete -c ipfs -n '__fish_ipfs_use_subcommand name pubsub subs' -a subs -d "Show current name subscriptions."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from name pubsub subs' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from name pubsub subs' -r -l ipns-base -d "Encoding used for keys: Can either be a multibase encoded CID or a base58btc encoded multihash. Takes {b58mh|base36|k|base32|b...}. Default: base36."



# name resolve
complete -c ipfs -n '__fish_ipfs_use_subcommand name resolve' -a resolve -d "Resolve IPNS names."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from name resolve' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from name resolve' -s r -l recursive -d "Resolve until the result is not an IPNS name. Default: true."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from name resolve' -s n -l nocache -d "Do not use cached entries."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from name resolve' -s s -l stream -d "Stream entries as they are found."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from name resolve' -r -l dht-record-count -d "Number of records to request for DHT resolution."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from name resolve' -r -l dht-timeout -d "Max time to collect values during DHT resolution eg "30s". Pass 0 for no timeout."



# object
complete -c ipfs -n '__fish_ipfs_use_subcommand object' -a object -d "Deprecated commands to interact with dag-pb objects. Use 'dag' or 'files' instead."

# object data
complete -c ipfs -n '__fish_ipfs_use_subcommand object data' -a data -d "Deprecated way to read the raw bytes of a dag-pb object: use 'dag get' instead."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from object data' -F


# object diff
complete -c ipfs -n '__fish_ipfs_use_subcommand object diff' -a diff -d "Display the diff between two IPFS objects."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from object diff' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from object diff' -s v -l verbose -d "Print extra information."


# object get
complete -c ipfs -n '__fish_ipfs_use_subcommand object get' -a get -d "Deprecated way to get and serialize the dag-pb node. Use 'dag get' instead"
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from object get' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from object get' -r -l data-encoding -d "Encoding type of the data field, either "text" or "base64". Default: text."


# object links
complete -c ipfs -n '__fish_ipfs_use_subcommand object links' -a links -d "Deprecated way to output links in the specified dag-pb object: use 'dag get' instead."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from object links' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from object links' -s v -l headers -d "Print table headers (Hash, Size, Name)."


# object new
complete -c ipfs -n '__fish_ipfs_use_subcommand object new' -a new -d "Deprecated way to create a new dag-pb object from a template."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from object new' -F


# object patch
complete -c ipfs -n '__fish_ipfs_use_subcommand object patch' -a patch -d "Deprecated way to create a new merkledag object based on an existing one. Use MFS with 'files cp|rm' instead."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from object patch' -l allow-big-block -d "Disable block size check and allow creation of blocks bigger than 1MiB. WARNING: such blocks won't be transferable over the standard bitswap. Default: false."

# object patch add-link
complete -c ipfs -n '__fish_ipfs_use_subcommand object patch add-link' -a add-link -d "Deprecated way to add a link to a given dag-pb."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from object patch add-link' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from object patch add-link' -s p -l create -d "Create intermediary nodes."


# object patch append-data
complete -c ipfs -n '__fish_ipfs_use_subcommand object patch append-data' -a append-data -d "Deprecated way to append data to the data segment of a DAG node."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from object patch append-data' -F


# object patch rm-link
complete -c ipfs -n '__fish_ipfs_use_subcommand object patch rm-link' -a rm-link -d "Deprecated way to remove a link from dag-pb object."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from object patch rm-link' -F


# object patch set-data
complete -c ipfs -n '__fish_ipfs_use_subcommand object patch set-data' -a set-data -d "Deprecated way to set the data field of dag-pb object."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from object patch set-data' -F



# object put
complete -c ipfs -n '__fish_ipfs_use_subcommand object put' -a put -d "Deprecated way to store input as a DAG object. Use 'dag put' instead."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from object put' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from object put' -l pin -d "Pin this object when adding."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from object put' -s q -l quiet -d "Write minimal output."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from object put' -r -l inputenc -d "Encoding type of input data. One of: {"protobuf", "json"}. Default: json."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from object put' -r -l datafieldenc -d "Encoding type of the data field, either "text" or "base64". Default: text."


# object stat
complete -c ipfs -n '__fish_ipfs_use_subcommand object stat' -a stat -d "Deprecated way to read stats for the dag-pb node. Use 'files stat' instead."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from object stat' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from object stat' -l human -d "Print sizes in human readable format (e.g., 1K 234M 2G)."



# p2p
complete -c ipfs -n '__fish_ipfs_use_subcommand p2p' -a p2p -d "Libp2p stream mounting."

# p2p close
complete -c ipfs -n '__fish_ipfs_use_subcommand p2p close' -a close -d "Stop listening for new connections to forward."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from p2p close' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from p2p close' -s a -l all -d "Close all listeners."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from p2p close' -r -s p -l protocol -d "Match protocol name."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from p2p close' -r -s l -l listen-address -d "Match listen address."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from p2p close' -r -s t -l target-address -d "Match target address."


# p2p forward
complete -c ipfs -n '__fish_ipfs_use_subcommand p2p forward' -a forward -d "Forward connections to libp2p service."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from p2p forward' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from p2p forward' -l allow-custom-protocol -d "Don't require /x/ prefix."


# p2p listen
complete -c ipfs -n '__fish_ipfs_use_subcommand p2p listen' -a listen -d "Create libp2p service."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from p2p listen' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from p2p listen' -l allow-custom-protocol -d "Don't require /x/ prefix."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from p2p listen' -s r -l report-peer-id -d "Send remote base58 peerid to target when a new connection is established."


# p2p ls
complete -c ipfs -n '__fish_ipfs_use_subcommand p2p ls' -a ls -d "List active p2p listeners."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from p2p ls' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from p2p ls' -s v -l headers -d "Print table headers (Protocol, Listen, Target)."


# p2p stream
complete -c ipfs -n '__fish_ipfs_use_subcommand p2p stream' -a stream -d "P2P stream management."

# p2p stream close
complete -c ipfs -n '__fish_ipfs_use_subcommand p2p stream close' -a close -d "Close active p2p stream."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from p2p stream close' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from p2p stream close' -s a -l all -d "Close all streams."


# p2p stream ls
complete -c ipfs -n '__fish_ipfs_use_subcommand p2p stream ls' -a ls -d "List active p2p streams."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from p2p stream ls' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from p2p stream ls' -s v -l headers -d "Print table headers (ID, Protocol, Local, Remote)."




# pin
complete -c ipfs -n '__fish_ipfs_use_subcommand pin' -a pin -d "Pin (and unpin) objects to local storage."

# pin add
complete -c ipfs -n '__fish_ipfs_use_subcommand pin add' -a add -d "Pin objects to local storage."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin add' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin add' -s r -l recursive -d "Recursively pin the object linked to by the specified object(s). Default: true."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin add' -l progress -d "Show progress."


# pin ls
complete -c ipfs -n '__fish_ipfs_use_subcommand pin ls' -a ls -d "List objects pinned to local storage."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin ls' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin ls' -s q -l quiet -d "Write just hashes of objects."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin ls' -s s -l stream -d "Enable streaming of pins as they are discovered."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin ls' -r -s t -l type -d "The type of pinned keys to list. Can be "direct", "indirect", "recursive", or "all". Default: all."


# pin remote
complete -c ipfs -n '__fish_ipfs_use_subcommand pin remote' -a remote -d "Pin (and unpin) objects to remote pinning service."

# pin remote add
complete -c ipfs -n '__fish_ipfs_use_subcommand pin remote add' -a add -d "Pin object to remote pinning service."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin remote add' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin remote add' -l background -d "Add to the queue on the remote service and return immediately (does not wait for pinned status). Default: false."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin remote add' -r -l service -d "Name of the remote pinning service to use (mandatory)."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin remote add' -r -l name -d "An optional name for the pin."


# pin remote ls
complete -c ipfs -n '__fish_ipfs_use_subcommand pin remote ls' -a ls -d "List objects pinned to remote pinning service."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin remote ls' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin remote ls' -r -l service -d "Name of the remote pinning service to use (mandatory)."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin remote ls' -r -l name -d "Return pins with names that contain the value provided (case-sensitive, exact match)."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin remote ls' -r -l cid -d "Return pins for the specified CIDs (comma-separated)."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin remote ls' -r -l status -d "Return pins with the specified statuses (queued,pinning,pinned,failed). Default: [pinned]."


# pin remote rm
complete -c ipfs -n '__fish_ipfs_use_subcommand pin remote rm' -a rm -d "Remove pins from remote pinning service."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin remote rm' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin remote rm' -l force -d "Allow removal of multiple pins matching the query without additional confirmation. Default: false."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin remote rm' -r -l service -d "Name of the remote pinning service to use (mandatory)."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin remote rm' -r -l name -d "Remove pins with names that contain provided value (case-sensitive, exact match)."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin remote rm' -r -l cid -d "Remove pins for the specified CIDs."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin remote rm' -r -l status -d "Remove pins with the specified statuses (queued,pinning,pinned,failed). Default: [pinned]."


# pin remote service
complete -c ipfs -n '__fish_ipfs_use_subcommand pin remote service' -a service -d "Configure remote pinning services."

# pin remote service add
complete -c ipfs -n '__fish_ipfs_use_subcommand pin remote service add' -a add -d "Add remote pinning service."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin remote service add' -F


# pin remote service ls
complete -c ipfs -n '__fish_ipfs_use_subcommand pin remote service ls' -a ls -d "List remote pinning services."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin remote service ls' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin remote service ls' -l stat -d "Try to fetch and display current pin count on remote service (queued/pinning/pinned/failed). Default: false."


# pin remote service rm
complete -c ipfs -n '__fish_ipfs_use_subcommand pin remote service rm' -a rm -d "Remove remote pinning service."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin remote service rm' -F




# pin rm
complete -c ipfs -n '__fish_ipfs_use_subcommand pin rm' -a rm -d "Remove object from pin-list."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin rm' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin rm' -s r -l recursive -d "Recursively unpin the object linked to by the specified object(s). Default: true."


# pin update
complete -c ipfs -n '__fish_ipfs_use_subcommand pin update' -a update -d "Update a recursive pin."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin update' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin update' -l unpin -d "Remove the old pin. Default: true."


# pin verify
complete -c ipfs -n '__fish_ipfs_use_subcommand pin verify' -a verify -d "Verify that recursive pins are complete."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin verify' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin verify' -l verbose -d "Also write the hashes of non-broken pins."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pin verify' -s q -l quiet -d "Write just hashes of broken pins."



# ping
complete -c ipfs -n '__fish_ipfs_use_subcommand ping' -a ping -d "Send echo request packets to IPFS hosts."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from ping' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from ping' -r -s n -l count -d "Number of ping messages to send. Default: 10."


# pubsub
complete -c ipfs -n '__fish_ipfs_use_subcommand pubsub' -a pubsub -d "An experimental publish-subscribe system on ipfs."

# pubsub ls
complete -c ipfs -n '__fish_ipfs_use_subcommand pubsub ls' -a ls -d "List subscribed topics by name."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pubsub ls' -F


# pubsub peers
complete -c ipfs -n '__fish_ipfs_use_subcommand pubsub peers' -a peers -d "List peers we are currently pubsubbing with."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pubsub peers' -F


# pubsub pub
complete -c ipfs -n '__fish_ipfs_use_subcommand pubsub pub' -a pub -d "Publish data to a given pubsub topic."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pubsub pub' -F


# pubsub sub
complete -c ipfs -n '__fish_ipfs_use_subcommand pubsub sub' -a sub -d "Subscribe to messages on a given topic."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from pubsub sub' -F



# refs
complete -c ipfs -n '__fish_ipfs_use_subcommand refs' -a refs -d "List links (references) from an object."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from refs' -s e -l edges -d "Emit edge format: `<from> -> <to>`."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from refs' -s u -l unique -d "Omit duplicate refs from output."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from refs' -s r -l recursive -d "Recursively list links of child nodes."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from refs' -r -l format -d "Emit edges with given format. Available tokens: <src> <dst> <linkname>. Default: <dst>."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from refs' -r -l max-depth -d "Only for recursive refs, limits fetch and listing to the given depth. Default: -1."

# refs local
complete -c ipfs -n '__fish_ipfs_use_subcommand refs local' -a local -d "List all local references."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from refs local' -F



# repo
complete -c ipfs -n '__fish_ipfs_use_subcommand repo' -a repo -d "Manipulate the IPFS repo."

# repo fsck
complete -c ipfs -n '__fish_ipfs_use_subcommand repo fsck' -a fsck -d "Remove repo lockfiles."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from repo fsck' -F


# repo gc
complete -c ipfs -n '__fish_ipfs_use_subcommand repo gc' -a gc -d "Perform a garbage collection sweep on the repo."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from repo gc' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from repo gc' -l stream-errors -d "Stream errors."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from repo gc' -s q -l quiet -d "Write minimal output."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from repo gc' -l silent -d "Write no output."


# repo ls
complete -c ipfs -n '__fish_ipfs_use_subcommand repo ls' -a ls -d "List all local references."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from repo ls' -F


# repo migrate
complete -c ipfs -n '__fish_ipfs_use_subcommand repo migrate' -a migrate -d "Apply any outstanding migrations to the repo."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from repo migrate' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from repo migrate' -l allow-downgrade -d "Allow downgrading to a lower repo version."


# repo stat
complete -c ipfs -n '__fish_ipfs_use_subcommand repo stat' -a stat -d "Get stats for the currently used repo."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from repo stat' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from repo stat' -s s -l size-only -d "Only report RepoSize and StorageMax."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from repo stat' -s H -l human -d "Print sizes in human readable format (e.g., 1K 234M 2G)."


# repo verify
complete -c ipfs -n '__fish_ipfs_use_subcommand repo verify' -a verify -d "Verify all blocks in repo are not corrupted."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from repo verify' -F


# repo version
complete -c ipfs -n '__fish_ipfs_use_subcommand repo version' -a version -d "Show the repo version."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from repo version' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from repo version' -s q -l quiet -d "Write minimal output."



# resolve
complete -c ipfs -n '__fish_ipfs_use_subcommand resolve' -a resolve -d "Resolve the value of names to IPFS."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from resolve' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from resolve' -s r -l recursive -d "Resolve until the result is an IPFS name. Default: true."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from resolve' -r -l dht-record-count -d "Number of records to request for DHT resolution."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from resolve' -r -l dht-timeout -d "Max time to collect values during DHT resolution eg "30s". Pass 0 for no timeout."


# routing
complete -c ipfs -n '__fish_ipfs_use_subcommand routing' -a routing -d "Issue routing commands."

# routing findpeer
complete -c ipfs -n '__fish_ipfs_use_subcommand routing findpeer' -a findpeer -d "Find the multiaddresses associated with a Peer ID."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from routing findpeer' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from routing findpeer' -s v -l verbose -d "Print extra information."


# routing findprovs
complete -c ipfs -n '__fish_ipfs_use_subcommand routing findprovs' -a findprovs -d "Find peers that can provide a specific value, given a key."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from routing findprovs' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from routing findprovs' -s v -l verbose -d "Print extra information."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from routing findprovs' -r -s n -l num-providers -d "The number of providers to find. Default: 20."


# routing get
complete -c ipfs -n '__fish_ipfs_use_subcommand routing get' -a get -d "Given a key, query the routing system for its best value."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from routing get' -F


# routing provide
complete -c ipfs -n '__fish_ipfs_use_subcommand routing provide' -a provide -d "Announce to the network that you are providing given values."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from routing provide' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from routing provide' -s v -l verbose -d "Print extra information."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from routing provide' -s r -l recursive -d "Recursively provide entire graph."


# routing put
complete -c ipfs -n '__fish_ipfs_use_subcommand routing put' -a put -d "Write a key/value pair to the routing system."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from routing put' -F



# shutdown
complete -c ipfs -n '__fish_ipfs_use_subcommand shutdown' -a shutdown -d "Shut down the IPFS daemon."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from shutdown' -F


# stats
complete -c ipfs -n '__fish_ipfs_use_subcommand stats' -a stats -d "Query IPFS statistics."

# stats bitswap
complete -c ipfs -n '__fish_ipfs_use_subcommand stats bitswap' -a bitswap -d "Show some diagnostic information on the bitswap agent."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from stats bitswap' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from stats bitswap' -s v -l verbose -d "Print extra information."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from stats bitswap' -l human -d "Print sizes in human readable format (e.g., 1K 234M 2G)."


# stats bw
complete -c ipfs -n '__fish_ipfs_use_subcommand stats bw' -a bw -d "Print IPFS bandwidth information."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from stats bw' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from stats bw' -l poll -d "Print bandwidth at an interval."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from stats bw' -r -s p -l peer -d "Specify a peer to print bandwidth for."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from stats bw' -r -s t -l proto -d "Specify a protocol to print bandwidth for."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from stats bw' -r -s i -l interval -d "Time interval to wait between updating output, if 'poll' is true.

    This accepts durations such as "300s", "1.5h" or "2h45m". Valid time units are:
    "ns", "us" (or "µs"), "ms", "s", "m", "h". Default: 1s."


# stats dht
complete -c ipfs -n '__fish_ipfs_use_subcommand stats dht' -a dht -d "Returns statistics about the node's DHT(s)."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from stats dht' -F


# stats provide
complete -c ipfs -n '__fish_ipfs_use_subcommand stats provide' -a provide -d "Returns statistics about the node's (re)provider system."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from stats provide' -F


# stats repo
complete -c ipfs -n '__fish_ipfs_use_subcommand stats repo' -a repo -d "Get stats for the currently used repo."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from stats repo' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from stats repo' -s s -l size-only -d "Only report RepoSize and StorageMax."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from stats repo' -s H -l human -d "Print sizes in human readable format (e.g., 1K 234M 2G)."



# swarm
complete -c ipfs -n '__fish_ipfs_use_subcommand swarm' -a swarm -d "Interact with the swarm."

# swarm addrs
complete -c ipfs -n '__fish_ipfs_use_subcommand swarm addrs' -a addrs -d "List known addresses. Useful for debugging."

# swarm addrs listen
complete -c ipfs -n '__fish_ipfs_use_subcommand swarm addrs listen' -a listen -d "List interface listening addresses."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from swarm addrs listen' -F


# swarm addrs local
complete -c ipfs -n '__fish_ipfs_use_subcommand swarm addrs local' -a local -d "List local addresses."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from swarm addrs local' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from swarm addrs local' -l id -d "Show peer ID in addresses."



# swarm connect
complete -c ipfs -n '__fish_ipfs_use_subcommand swarm connect' -a connect -d "Open connection to a given address."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from swarm connect' -F


# swarm disconnect
complete -c ipfs -n '__fish_ipfs_use_subcommand swarm disconnect' -a disconnect -d "Close connection to a given address."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from swarm disconnect' -F


# swarm filters
complete -c ipfs -n '__fish_ipfs_use_subcommand swarm filters' -a filters -d "Manipulate address filters."

# swarm filters add
complete -c ipfs -n '__fish_ipfs_use_subcommand swarm filters add' -a add -d "Add an address filter."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from swarm filters add' -F


# swarm filters rm
complete -c ipfs -n '__fish_ipfs_use_subcommand swarm filters rm' -a rm -d "Remove an address filter."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from swarm filters rm' -F



# swarm peering
complete -c ipfs -n '__fish_ipfs_use_subcommand swarm peering' -a peering -d "Modify the peering subsystem."

# swarm peering add
complete -c ipfs -n '__fish_ipfs_use_subcommand swarm peering add' -a add -d "Add peers into the peering subsystem."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from swarm peering add' -F


# swarm peering ls
complete -c ipfs -n '__fish_ipfs_use_subcommand swarm peering ls' -a ls -d "List peers registered in the peering subsystem."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from swarm peering ls' -F


# swarm peering rm
complete -c ipfs -n '__fish_ipfs_use_subcommand swarm peering rm' -a rm -d "Remove a peer from the peering subsystem."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from swarm peering rm' -F



# swarm peers
complete -c ipfs -n '__fish_ipfs_use_subcommand swarm peers' -a peers -d "List peers with open connections."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from swarm peers' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from swarm peers' -s v -l verbose -d "display all extra information."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from swarm peers' -l streams -d "Also list information about open streams for each peer."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from swarm peers' -l latency -d "Also list information about latency to each peer."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from swarm peers' -l direction -d "Also list information about the direction of connection."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from swarm peers' -l identify -d "Also list information about peers identify."


# swarm resources
complete -c ipfs -n '__fish_ipfs_use_subcommand swarm resources' -a resources -d "Get a summary of all resources accounted for by the libp2p Resource Manager."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from swarm resources' -F



# tar
complete -c ipfs -n '__fish_ipfs_use_subcommand tar' -a tar -d "Utility functions for tar files in ipfs."

# tar add
complete -c ipfs -n '__fish_ipfs_use_subcommand tar add' -a add -d "Import a tar file into IPFS."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from tar add' -F


# tar cat
complete -c ipfs -n '__fish_ipfs_use_subcommand tar cat' -a cat -d "Export a tar file from IPFS."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from tar cat' -F



# update
complete -c ipfs -n '__fish_ipfs_use_subcommand update' -a update -d ""
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from update' -F


# urlstore
complete -c ipfs -n '__fish_ipfs_use_subcommand urlstore' -a urlstore -d "Interact with urlstore."

# urlstore add
complete -c ipfs -n '__fish_ipfs_use_subcommand urlstore add' -a add -d "Add URL via urlstore."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from urlstore add' -F
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from urlstore add' -s t -l trickle -d "Use trickle-dag format for dag generation."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from urlstore add' -l pin -d "Pin this object when adding. Default: true."



# version
complete -c ipfs -n '__fish_ipfs_use_subcommand version' -a version -d "Show IPFS version information."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from version' -s n -l number -d "Only show the version number."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from version' -l commit -d "Show the commit hash."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from version' -l repo -d "Show repo version."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from version' -l all -d "Show all version information."

# version deps
complete -c ipfs -n '__fish_ipfs_use_subcommand version deps' -a deps -d "Shows information about dependencies used for build."
complete -c ipfs -n '__fish_ipfs_seen_all_subcommands_from version deps' -F



