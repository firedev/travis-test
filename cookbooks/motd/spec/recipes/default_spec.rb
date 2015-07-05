require_relative '../spec_helper'

describe 'motd::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }
  before do
    stub_data_bag_item('global-properties', 'company').and_return(name: 'Die')
  end
  it 'should create a motd file with the company name' do
    allow_any_instance_of(Chef::Recipe)
      .to receive(:data_bag_item)
        .with('global-properties', 'company')
        .and_return(
          id: 'company',
          name: 'Die'
    )
    expect(chef_run)
      .to render_file('/etc/motd.tail')
        .with_content('This is Die')
  end
  # Write quick specs using `it` blocks with implied subjects
  # it { should do_something('...') }

  # Write full examples using the `expect` syntax
  # it 'does something' do
  #   expect(subject).to do_something('...')
  # end

  # Use an explicit subject
  # let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  # it 'does something' do
  #   expect(chef_run).to do_something('...')
  # end
end
